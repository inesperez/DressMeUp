class ProcessImageDescriptionJob < ApplicationJob
  queue_as :default

  def perform(garment)
    return unless garment.photo.attached?

    image_url = "https://res.cloudinary.com/dyahhsgzn/image/upload/v1/development/#{garment.photo.key}?_a=BACE6GBn"
    description = describe_image(image_url)
    garment.update(ai_description: description)
  end

  def describe_image(image_url)
    client = OpenAI::Client.new

    messages = [
      { type: "text",
        text: "

    Role
    - You are an expert at describing garments.

    Task
    - Focus on the biggest, most visible garment in the image. Ignore any other items
    or elements in the image.

    1. Identify the garment type:
      - Determine if the garment is a **top** (an upper body garment such as a t-shirt, a hoodie, a jacket or similar) or a **bottom** (lower body garment, such as pants, trousers, skirts, or shorts).

    2. Describe the identified garment:
      - Once you have identified the garment as either a 'top' or 'bottom', add a detailed description including its color, textile,
        pattern, style, occasion suitability, and appropriate weather conditions.

    Otput
      - **Output must clearly state that the garment is either a 'top' or 'bottom'.**
      - Do not include any other descriptions at this stage.
      - Ensure each output follows this format:
      { \"garment_type\": \"top\" or \"bottom\", \"description\": \"[detailed description including color, textile, pattern, occasion, and weather]\" }

    **Example Output**:
    {
      \"garment_type\": \"top\",
      \"description\": \"Red cotton shirt with a striped pattern, suitable for casual occasions and warm weather.\"
    }

    Check your identification and description to ensure that each garment is clearly categorized **only as a 'top' or 'bottom'**
    before adding any further description. Do not mix up the categories." },


      { type: "image_url",
        image_url: {
          url: image_url
        }
      }
    ]

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [
          { role: "user", content: messages }
        ]
      }
    )

    # Extract the description from the response
    response["choices"].first["message"]["content"]
  end
end
