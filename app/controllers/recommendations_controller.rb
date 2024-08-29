class RecommendationsController < ApplicationController

  def preferences
  end

  def index
    @occasion = params[:occasion]
    @feeling = params[:feeling]
    @custom_occasion = params[:custom_occasion]

    @garments = Garment.all.map { |garment| "#{garment.ai_description} (#{garment.id})" }.join(" ")

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "user",
          content:
          "Below are descriptions of my clothes and their garment IDs.

          Match my clothes together based on their descriptions to create potential outfits that combine 2 garments,
          a top and a bottom. Rank them from the best-looking to the worst-looking outfits. Consider the following preferences:
          Occasion: #{@occasion} and #{@custom_occasion} and , Feeling: #{@feeling}. Output the ranked outfits
          **only** as a combination of garment IDs in **JSON format** called 'matches' which contains **only**
          the matched IDs in an array #{@garments}

          The output **must** follow this exact format:
            { \"matches\": [ [top1, bottom1], [top2, bottom2], [top3, bottom3], ... ] }

          Replace 'top1', 'bottom1', etc., with the actual garment IDs in integer format. Do not include any other text, explanations,
          or descriptions—just the JSON object."
        }
      ]
    })

    @content = chatgpt_response["choices"][0]["message"]["content"]
    @recommendations = Recommendation.all
    # ranked_outfits[0][:matching]%>
  end

end
