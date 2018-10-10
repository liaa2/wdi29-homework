class MountainsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  #CREATE 1
  def new
  end

  #CREATE 2
  def create
  Mountain.create(
   name: params[:name],
   country: params[:country],
   elevation: params[:elevation],
   pointyness: params[:pointyness],
   image: params[:image]
  )
  #Create has no template of its own
  redirect_to(mountains_path)

  end

  #READ 1
  def index
    @mountains = Mountain.all
  end

  #READ 2
  def show
    @mountain = Mountain.find(params[:id])
  end

  #UPDATE 1
  def edit
    @mountain = Mountain.find(params[:id])
  end

  #Update 2 - process update form
  def update
    mountain = Mountain.find(params[:id])
    mountain.update(
     name: params[:name],
     country: params[:country],
     elevation: params[:elevation],
     pointyness: params[:pointyness],
     image: params[:image]
    )
    #Create has no template of its own
    redirect_to(mountain_path(mountain))
  end

  #DELETE
  def destroy
    mountain = Mountain.find(params[:id])
    mountain.destroy

    redirect_to(mountains_path)
  end

end
