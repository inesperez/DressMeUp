class RecommendationsController < ApplicationController
  MAX_RETRIES = 3

  def preferences
    @garment = Garment.find_by(id: params[:garment]) if params[:garment]
    @weather = get_weather
    @max_temp = get_temp_max
    @weather_summary = get_weather_summary
    @current_temp = get_current_temp
    @user = current_user
    @location = @user.location
  end

  def index
    @user = current_user
    @garment = Garment.find_by(id: params[:garment])
    @occasion = params[:occasion]
    @feeling = params[:feeling]
    @custom_occasion = params[:custom_occasion]
    @garments = Garment.all.map { |garment| "#{garment.ai_description} (#{garment.id})" }.join(" ")
    # Call the weather method to set @weather
    @weather = get_weather
    chatgpt_response_content = get_chatgpt_response

    if chatgpt_response_content.nil?
      # Handle the error case (e.g., render an error message or default response)
      render plain: "Error in fetching recommendations. Please try again later.", status: :service_unavailable
      return
    end

    response_json = "{ \"matches\": #{chatgpt_response_content} }"
    recommendation_ids = JSON.parse(response_json)["matches"]
    @recommendations = recommendation_ids.map { |ids| ids.map { |garment_id| Garment.find(garment_id) } }
  end

  def success
    @top = Garment.find_by(id: params[:top])
    @bottom = Garment.find_by(id: params[:bottom])
  end

  private

  def get_chatgpt_response
    client = OpenAI::Client.new
    retries = 0

    while retries <= MAX_RETRIES
      begin
        if @garment
          response = client.chat(parameters: {
            model: "gpt-4o",
            temperature: 0.4,
            messages: [
              {
                role: "user",
                content: "
                Your role:
                You are a fashion stylist who helps people decide what to wear.
                You have access to a user's wardrobe and their preferences.

                Your inputs:
                These are user preferences for the outfit recommendation (if user has no preferences, they are empty or nil):
                Occasion: #{@occasion}
                Custom Occasion: #{@custom_occasion}
                Feeling: #{@feeling}
                Weather: #{@weather}

                These are the descriptions of the user's clothes and their garment IDs: #{@garments}
                The user has chosen the specific garment which has the id of: #{@garment.id}, and a description of: #{@garment.ai_description}.

                **Your task:**
                1. Look at the #{@garment.ai_description} and identify the type of garment that the user has chosen, the options are either:
                 - *top* (garment type: upper body garment)
                 - *bottom* (garment type: lower body garment)
                2. Match clothes of the *opposite type to that which the user has chosen*, based on their description, to create potential outfits that combine **exactly 2 garments**:
                  - i.e. if the user has chosen a top, only match bottoms. If the user has chosen a bottom, only match tops.
                3. Order these outfits from the best-looking to the worst-looking.
                4. **Do not include any outfits that do not follow these rules.**

                **Your output:**
                - Each outfit must contain the #{@garment.id} the user has chosen and only one other garment.
                - Output the ranked outfits **only** as a combination of garment IDs in an array
                which contains **only** the matched IDs in an array.
                - Each combination of garments should only appear once. This means that each array in your output should contain a unique combination of garment IDs.


                Provide the ranked outfits only as an array of arrays, without any code block markers, labels, or extra formatting. It should be formatted as follows:
                [ [top1, bottom1], [top2, bottom2], [top3, bottom3], [top4, bottom4], [top5, bottom5], ... ]

                - Replace 'top1', 'bottom1', etc., with the actual garment IDs in integer format.
                - Do not include any other text, explanations, or descriptions, only the array of IDs.
                - Double-check each combination to ensure it contains exactly one top (upper-body clothing) and one bottom (lower body clothing). Clothing can be reused in different combinations.
                - **Failure to adhere to this format is not acceptable.**
                "
              }
            ]
          })

        else
          response = client.chat(parameters: {
            model: "gpt-4o",
            temperature: 0.4,
            messages: [
              {
                role: "user",
                content: "
                Your role:
                You are a fashion stylist who helps people decide what to wear.
                You have access to a user's wardrobe and their preferences.

                Your inputs:
                These are user preferences for the outfit recommendation (if user has no preferences, they are empty or nil):
                Occasion: #{@occasion}
                Custom Occasion: #{@custom_occasion}
                Feeling: #{@feeling}
                Weather: #{@weather}

                These are the descriptions of the user's clothes and their garment IDs: #{@garments}

                **Your task:**
                1. Look at the ai_description field and identify the garment type. The options are either:
                 - *top* (garment type: upper body garment)
                 - *bottom* (garment type: lower body garment)
                2. Match the clothes together based on their descriptions to create potential outfits
                that combine **exactly 2 garments**, **one top** and **one bottom**
                    - **Important:** if a garment is a top, match it only with bottoms; if a garment is a bottom, match it only with tops. **Never match two tops together, and never match two bottoms together.**
                3. After identifying valid combinations, rank these outfits from the best-looking to the worst-looking.
                4. **Do not include any outfits that do not follow these rules.**

                **Your output:**
                - Output the ranked outfits **only** as a combination of garment IDs in an array
                which contains **only** the matched IDs in an array.
                - The same garment can be used in multiple outfits, but each combination of garments should only appear once. This means that each array in your output should contain a unique combination of garment IDs.

                Provide the ranked outfits only as an array of arrays, without any code block markers, labels, or extra formatting. It should be formatted as follows:
                [ [top1, bottom1], [top2, bottom2], [top3, bottom3], [top4, bottom4], [top5, bottom5], ... ]

                - Replace 'top1', 'bottom1', etc., with the actual garment IDs in integer format.
                - Do not include any other text, explanations, or descriptions, only the array of IDs.
                - Double-check each combination to ensure it contains exactly one top (upper-body clothing) and one bottom (lower body clothing). Clothing can be reused in different combinations.
                - **Failure to adhere to this format is not acceptable.**
                "
              }
            ]
          })
        end

        if response.key?("error")
          retry_after = response["error"]["Retry-After"].to_i || 10
          Rails.logger.info("Rate limit exceeded. Retrying in #{retry_after} seconds...")
          sleep(retry_after)
          retries += 1
        else
          return response["choices"][0]["message"]["content"].strip
        end

      rescue Faraday::Error => e
        Rails.logger.error("Request failed: #{e.message}")
        retries += 1
        sleep(10) if retries <= MAX_RETRIES
      end
    end

    return nil
  end

  def get_weather
    @user = current_user
    weather_service = WeatherService.new(ENV['OPENWEATHER_API_KEY'])
    weather_summary = weather_service.current_weather(@user.location)["weather"][0]["description"]
    weather_temp = weather_service.current_weather(@user.location)["main"]["temp"]
    return (weather_summary + " " + weather_temp.to_s)
    # weather_temp = (weather_service.current_weather(@user.location).main.temp + 273)
    # weather = (weather_summary + " " + weather_temp.to_s)
  end

  def get_weather_summary
    @user = current_user
    weather_service = WeatherService.new(ENV['OPENWEATHER_API_KEY'])
    @weather_summary = weather_service.current_weather(@user.location)["weather"][0]["description"]
  end

  def get_current_temp
    @user = current_user
    weather_service = WeatherService.new(ENV['OPENWEATHER_API_KEY'])
    @weather_temp = weather_service.current_weather(@user.location)["main"]["temp"].round()
  end

  def get_temp_max
    @user = current_user
    weather_service = WeatherService.new(ENV['OPENWEATHER_API_KEY'])
    @temp_max = weather_service.current_weather(@user.location)["main"]["temp_max"].round()
  end
end
