class GarmentsController < ApplicationController

  def index
    @garments = Garment.all
  end
end
