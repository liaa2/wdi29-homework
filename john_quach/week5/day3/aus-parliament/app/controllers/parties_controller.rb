class PartiesController < ApplicationController

# CREATE ##########################################
  def new
    @party = Party.new
  end

  def create
    Party.create party_params  # pass in the strong version of the form params
    redirect_to( parties_path )  # redirect to the index "/parties"
  end

#READ. List the all the Party.
  def index
    @parties = Party.all
  end

#Return one politcal Party in form
  def show
    @party = Party.find params[:id]
  end

# UPDATE
  def edit
    @party = Party.find params[:id]
  end

  def update
    @party = Party.find params[:id]   # route is PATCH "/works/:id", so we have the ID in params
    @party.update party_params
    redirect_to party_path(@party.id)
  end

# DESTROY
  def destroy
    @party = Party.find params[:id]
    @party.destroy
    redirect_to( parties_path )
  end

  private

  def party_params
    # This method ensures that the 'party' key is set in the params hash, and then
    # makes sure only the permitted columns are taken from the form (and saved to the database)
    params.require(:party).permit( :name, :founded, :abbr, :leader, :position, :ideology, :image )
  end
end
