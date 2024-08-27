class GarmentsController < ApplicationController

  def show
    @garment = Garment.find(params[:id])
  end

  def edit
    @garment = Garment.find(params[:id])
  end

  def update
    @garment = Garment.find(params[:id])
    @garment = Garment.update(garment_params)
    if @garment.save
      redirect_to garment_path(@garment)
    end
  end

  def index
    @garments = Garment.all
  end

end
