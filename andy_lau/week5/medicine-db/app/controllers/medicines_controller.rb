class MedicinesController < ApplicationController


  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def add
    Medicine.create(
      name:       params[:name],
      iupac:      params[:iupac],
      molar_mass: params[:molar_mass],
      uses:       params[:uses],
      image:      params[:image]
    )
    redirect_to(medicines_path)
  end

  def edit
    @medicine = Medicine.find(params[:id])
  end

  def update
    Medicine.find(params[:id]).update(
      name:       params[:name],
      iupac:      params[:iupac],
      molar_mass: params[:molar_mass],
      uses:       params[:uses],
      image:      params[:image]
    )
    redirect_to(medicine_path(params[:id]))
  end

  def index
    @medicines = Medicine.all
  end

  def destroy
    Medicine.find(params[:id]).destroy
    redirect_to(medicines_path)
  end

  def show
    @medicine = Medicine.find params[:id]
  end
end
