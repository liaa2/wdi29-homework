class ChairsController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  def new  #create blank form
  end

  def create  #create submission
    Chair.create(
      name: params[:name],
      image: params[:image],
      legs: params[:legs],
      material: params[:material],
      recliner: params[:recliner]
    )
    redirect_to (chairs_path)

  end


  def index #show all chairs
    @chairs = Chair.all
  end

  def show #show individual chair
    @chair = Chair.find params[:id]
  end

  def edit
    @chair = Chair.find params[:id]
  end

  def update
    chair = Chair.find params[:id]
    puts "+++++++++++++++++++++++++++++++++++++++++++"
    puts chair
    puts "+++++++++++++++++++++++++++++++++++++++++++"
    chair.update(
      name: params[:name],
      image: params[:image],
      legs: params[:legs],
      material: params[:material],
      recliner: params[:recliner]
    )
    redirect_to(chair_path(chair.id))
  end

  def destroy
      chair = Chair.find params[:id]
      chair.destroy
      redirect_to(chairs_path)
  end
end
