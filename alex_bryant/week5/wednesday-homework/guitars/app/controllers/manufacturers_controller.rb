class ManufacturersController < ApplicationController

  #DELETE
  def destroy
    manufacturer = Manufacturer.find params[:id]
    manufacturer.destroy
    redirect_to manufacturers_path
  end

  #UPDATE
  def update
    @manufacturer = Manufacturer.find params[:id]
    @manufacturer.update(manufacturer_params)
    redirect_to manufacturer_path(@manufacturer.id)
  end

  def edit
    @manufacturer = Manufacturer.find params[:id]
  end

  #CREATE
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    Manufacturer.create(manufacturer_params)
    redirect_to manufacturers_path
  end

  #READ
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find params[:id]
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country, :founded, :image)
  end

end
