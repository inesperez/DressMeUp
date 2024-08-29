class RecommendationsController < ApplicationController

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

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o",
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

          Your task:
          Match the clothes together based on their descriptions to create potential outfits that combine 2 garments,
          a top and a bottom. Order them from the best-looking to the worst-looking outfit.

          Your output:
          Output the ranked outfits **only** as a combination of garment IDs in **JSON format** called 'matches'
          which contains **only** the matched IDs in an array.
          Match my clothes together based on their descriptions to create potential outfits that combine **exactly 2 garments:**
          - **One top** (garment type: upper body garment)
          - **One bottom** (garment type: lower body garment).

          The output **must** follow this exact format:
            { \"matches\": [ [top1, bottom1], [top2, bottom2], [top3, bottom3], ... ] }

          Replace 'top1', 'bottom1', etc., with the actual garment IDs in integer format. Each combination **must
          contain exactly one top (upper body clothing) and one bottom (lower body clothing)**. Double-check each
          combination to make sure this rule is followed. Clothing can be reused in different combinations.

          Do not include any other text, explanations, or descriptions—just the JSON object."
        }
      ]
    })

    response_json = chatgpt_response["choices"][0]["message"]["content"]
    recommendation_ids = JSON.parse(response_json)["matches"]
    @recommendations = recommendation_ids.map { |ids| ids.map { |garment_id| Garment.find(garment_id)} }

    # @recommendations = Recommendation.all
    # ranked_outfits[0][:matching]%>
  end

  private

  def get_weather
    @user = current_user
    weather_service = WeatherService.new(ENV['OPENWEATHER_API_KEY'])
    weather_summary = weather_service.current_weather(@user.location)["weather"][0]["description"]
    weather_temp = weather_service.current_weather(@user.location)["main"]["temp"]
    return (weather_summary + " " + weather_temp.to_s)
    # weather_temp = (weather_service.current_weather(@user.location).main.temp + 273)
    # weather = (weather_summary + " " + weather_temp.to_s)
  end
end
