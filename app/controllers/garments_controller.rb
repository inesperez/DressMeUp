require 'open-uri'

class GarmentsController < ApplicationController
  def new
    @garment = Garment.new
  end

  def create
    @user = current_user
    @garment = Garment.new(garment_params)
    @garment.user = @user
    if @garment.save
      process_image_and_generate_description(@garment)
      redirect_to garment_path(@garment), notice: 'Garment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @garment = Garment.find(params[:id])
  end

  def edit
    @garment = Garment.find(params[:id])
  end

  def update
    @garment = Garment.find(params[:id])
    ## The AI Bit
    if @garment.update(garment_params)
      # Regenerate AI description if the image is updated
      process_image_and_generate_description(@garment)
      redirect_to garment_path(@garment), notice: 'Garment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @garments = Garment.all
  end

  private

  def garment_params
    params.require(:garment).permit(:ai_description, :photo)
  end

  def process_image_and_generate_description(garment)
    return unless garment.photo.attached?

    image_url = "https://res.cloudinary.com/dyahhsgzn/image/upload/v1/development/#{garment.photo.key}?_a=BACE6GBn"
    p image_url
    description = describe_image(image_url)
    garment.update(ai_description: description)
  end

  def describe_image(image_url)
    client = OpenAI::Client.new

    messages = [
      { type: "text", text: "Focus on the main garment (the most visible garment) in each image. Ignore any other items
        or elements in the image.

1. Identify the garment type:
   - Determine if the garment is a **top** (upper body garment) or **bottom** (lower body garment).
   - **Output must state clearly and exclusively either 'top' or 'bottom'.**
   Do not include any other descriptions at this stage.

2. Describe the identified garment:
   - Once you have identified the garment as either a 'top' or 'bottom', add a description including its color, textile,
    pattern, occasion suitability, and appropriate weather conditions.

Ensure each output follows this format:
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
