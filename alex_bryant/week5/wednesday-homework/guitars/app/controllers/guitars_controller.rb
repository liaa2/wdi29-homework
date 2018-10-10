class GuitarsController < ApplicationController

  #DELETE
  def destroy
    guitar = Guitar.find params[:id]
    guitar.destroy
    redirect_to guitars_path
  end

  #UPDATE
  def update
    @guitar = Guitar.find params[:id]
    @guitar.update(guitar_params)
    redirect_to guitar_path(@guitar.id)
  end

  def edit
    @guitar = Guitar.find params[:id]
  end

  #CREATE
  def new
    @guitar = Guitar.new
  end

  def create
    Guitar.create(guitar_params)
    redirect_to guitars_path
  end

  #READ
  def index
    @guitars = Guitar.all
  end

  def show
    @guitar = Guitar.find params[:id]
  end

  private

  def guitar_params
    params.require(:guitar).permit(:name, :guitar_type, :price, :image)
  end

end
