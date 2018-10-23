class CampsitesController < ApplicationController
skip_before_action :verify_authenticity_token,
raise:  false
# Code below is squence of CRUD. Note the singular Campsite/campsi or plural campsites
# CREATE part 1: blank form
  def new
  end

  # CREATE part 2: form submit here, to create item
  def create

    Campsite.create(
      name: params[:name],
      location: params[:location],
      campsite_type: params[:campsite_type],
      max_people: params[:max_people],
      per_night: params[:per_night]
    )

    # CREATE has no template of its own:
    # redirect to index page
    redirect_to( campsites_path )

  end

# READ type 1: index of all items in 'campsites'
  def index
    # Get all rows in the campsites table
    # (as an array of Campsite objects)
    @campsites = Campsite.all
  end

  # READ type 2: show page, details for one item. whose ID we know
  def show
    # Gets us one row, and returns it as an object
    # (an instance of the Campsite model class)
    @campsite = Campsite.find params[:id]
  end

# end
# UPDATE part 1: show the prefilled edit form
  def edit
    @campsite = Campsite.find params[:id]
  end

  # UPDATE part 2: form submit to here,
  # update item in database and redirect to show page
  def update
    campsite = Campsite.find params[:id]
    campsite.update(
      name: params[:name],
      location: params[:location],
      campsite_type: params[:campsite_type],
      max_people: params[:max_people],
      per_night: params[:per_night]

    )

    # redirect to the show page for the campsite we just updated
    redirect_to( campsite_path(campsite.id) )
  end

  # DELETE: remove the item from the table
  def destroy
    campsite = Campsite.find params[:id]
    campsite.destroy

    redirect_to( campsites_path )
  end
end
