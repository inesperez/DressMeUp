class GarmentsController < ApplicationController

  def show
    @garment = Garment.find(params[:id])
  end

  def create
    @garment = Garment.new(garment_params)
    ## The AI Bit
    if @garment.save
      # Generate AI description if an image is uploaded
      process_image_and_generate_description(@garment)
      redirect_to garment_path(@garment), notice: 'Garment was successfully created.'
    else
      render :new
    end
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
      render :edit
    end
    # PREVIOUS CODE IN THIS ACTION
      # @garment = Garment.update(garment_params)
      # if @garment.save
      #   redirect_to garment_path(@garment)
      # end
  end

  def index
    @garments = Garment.all
  end

  private

  def garment_params
    params.require(:garment).permit(:image_url) # Ensure image is permitted
  end

  def process_image_and_generate_description(garment)
    if garment.image_url.present?
      description = describe_image(garment.image_url.url)
      garment.update(ai_description: description)
    end
  end

  def describe_image(image_url)
    # Convert the image to a binary string
    image_data = download_image(image_url)
    # Call the OpenAI API (Assuming you have the OpenAI client configured in an initializer)
    client = OpenAI::Client.new
    response = client.chat(
      model: "gpt-4-vision",  # Ensure you're using the GPT-4V model
      messages: [
        { role: "system", content: "Describe the following image." },
        { role: "user", content: "Please describe this image.", image: image_data }
      ]
    )

    # Extract the description from the response
    response["choices"].first["message"]["content"]
  end

  def download_image(url)
    # Download the image from the provided URL and return binary data
    require 'open-uri'
    URI.open(url).read
    # PREVIOUS CODE
      # uri = URI.parse(url)
      # response = Net::HTTP.get_response(uri)
      # response.body if response.is_a?(Net::HTTPSuccess)
  end
end
