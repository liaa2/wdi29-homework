class BrandsController < ApplicationController

  def new
    @brand = Brand.new
  end

  def create
    Brand.create(brand_params) # use string parans to filter the fields from the form (for security reasons)
    redirect_to(brands_path) # redirect to the index
  end


  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find params[:id]
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    @brand = Brand.find params[:id]
    @brand.update brand_params
    redirect_to(brand_path(@brand.id))
  end

  #DESTROY
  def destroy
    brand = Brand.find params[:id]
    brand.destroy
    redirect_to(brands_path) #to the index page
  end

  private
  def brand_params
    params.require(:brand).permit(:company_name, :founded, :hq, :ceo, :website, :slogan, :logo_url)
  end
end
