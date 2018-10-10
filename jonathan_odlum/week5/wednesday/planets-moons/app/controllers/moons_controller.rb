class MoonsController < ApplicationController

  #CREATE
  def new
    @moon = Moon.new
  end

  def create
    Moon.create moon_params
    redirect_to moons_path
  end

  #READ
  def index
    @moons = Moon.all
  end

  def show
    @moon = Moon.find(params[:id])
  end

  #UPDATE
  def edit
    @moon = Moon.find(params[:id])
  end

  def update
    @moon = Moon.find(params[:id])
    @moon.update moon_params
    redirect_to moon_path(@moon.id)
  end

  #DESTROY
  def destroy
    @moon = Moon.find(params[:id])
    @moon.destroy
    redirect_to moons_path
  end

  private

  def moon_params
    params.require(:moon).permit( :name, :period, :image, :discovery, :discoverer, :planet_id)
  end

end
