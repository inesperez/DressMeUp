class RecommendationsController < ApplicationController

  def index
    @garments = Garment.all.map { |garment| "#{garment.ai_description} (#{garment.id})" }.join(" ")

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [
        {
          role: "user",
          content: "Below are descriptions of my clothes and their garment IDs. Match my clothes together based on their descriptions to create potential outfits that combine 2 garments, a top and a bottom. Rank them from the best-looking to the worst-looking outfits. Output the ranked outfits only as a combination of garment IDs with the best match first and the worst match last. Output should be JSON called 'matches' which contains only the matched IDs in an array #{@garments}"
        }
      ]
    })
    @content = chatgpt_response["choices"][0]["message"]["content"]

    @recommendations = Recommendation.all
    # ranked_outfits[0][:matching]%>
  end
end
