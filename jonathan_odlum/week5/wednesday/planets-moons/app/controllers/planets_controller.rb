class PlanetsController < ApplicationController

  #CREATE
  def new
    @planet = Planet.new
  end

  def create
    Planet.create (planet_params)
    redirect_to planets_path
  end

  #READ
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  #UPDATE
  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet = Planet.find(params[:id])
    @planet.update planet_params
    redirect_to planet_path(@planet.id)
  end

  #DESTROY
  def destroy
    @planet = Planet.find(params[:id])
    @planet.destroy
    redirect_to planets_path
  end

  private

  def planet_params
    params.require(:planet).permit( :name, :orbit, :temperature, :year, :day, :image)
  end

end
