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
      redirect_to garments_path, notice: 'Garment was successfully created.'
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
end
