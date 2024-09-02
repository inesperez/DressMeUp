class RecommendationsController < ApplicationController

  MAX_RETRIES = 3

  def preferences
  end

  def index
    @user = current_user
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
    @recommendations = recommendation_ids.map { |ids| ids.map { |garment_id| Garment.find(garment_id)} }

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
        response = client.chat(parameters: {
          model: "gpt-4o",
          temperature: 0.5,
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
              1. Match the clothes together based on their descriptions to create potential outfits that combine **exactly 2 garments**:
                - **One top** (garment type: upper body garment)
                - **One bottom** (garment type: lower body garment)
              2. Order these outfits from the best-looking to the worst-looking.
              3. **Do not include any outfits that do not follow these rules.**

              **Your output:**
              - Output the ranked outfits **only** as a combination of garment IDs in an array
              which contains **only** the matched IDs in an array.
              Match my clothes together based on their descriptions to create potential outfits that combine **exactly 2 garments:**
              - **One top** (garment type: upper body garment)
              - **One bottom** (garment type: lower body garment).

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
  end

end
