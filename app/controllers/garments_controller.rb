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
      { type: "text", text: "Please describe the clothes in this image in detail ignoring any other items. Suggest other clothes that would match the pictured clothes:" },
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
