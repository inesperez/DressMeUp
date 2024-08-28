class GarmentsController < ApplicationController
  def new
    @garment = Garment.new
  end

  def create
    @user = current_user
    @garment = Garment.new(garment_params)
    @garment.user = @user
    if @garment.save
      redirect_to root_path
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
    if @garment.update(garment_params)
      redirect_to garment_path(@garment)
    end
  end

  def index
    @garments = Garment.all
  end

  private

  def garment_params
    params.require(:garment).permit(:ai_description, :photo) #need to add photo
  end
end
