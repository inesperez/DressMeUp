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

end

private

def garment_params
  params.require(:garment).permit(:text) #need to add photo
end
