class SneakersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  #CREATE 1
  def new
  end
  #CREATE 2
  def create
    Sneaker.create(
      brand:          params[:brand],
      silhouette:     params[:silhouette],
      colorway:       params[:colorway],
      heat_rating:    params[:heat_rating],
      release_date:   params[:release_date],
      image_url:      params[:image_url]
    )
    redirect_to(sneakers_path)
  end



  #READ 1
  def index
  @sneakers = Sneaker.all
  end
  #READ 2
  def show
    @sneaker = Sneaker.find params[:id]
  end



  #UPDATE 1
  def edit
    @sneaker = Sneaker.find params[:id]
  end
  #UPDATE 2
  def update
    sneaker = Sneaker.find params[:id]
    sneaker.update(
      brand:          params[:brand],
      silhouette:     params[:silhouette],
      colorway:       params[:colorway],
      heat_rating:    params[:heat_rating],
      release_date:   params[:release_date],
      image_url:      params[:image_url]
    )
    redirect_to(sneaker_path(sneaker.id))
  end



  #DELETE
  def destroy
    sneaker = Sneaker.find params[:id]
    sneaker.destroy

    redirect_to(sneakers_path)
  end
end
