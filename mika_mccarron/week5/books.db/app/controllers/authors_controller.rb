class AuthorsController < ApplicationController
  # CREATE ##########################################
  def new
    @author = Author.new
  end
  def create
    # use 'strong params' to filter the fields from the form (for security reasons)
    Author.create( author_params )
    # Artist.create(
    #   name: params[:artist][:name],
    #   nationality: params[:artist][:nationality],
    # )
    redirect_to( author_path )  # redirect to the index
  end


  # READ ############################################
  def index
    @authors = Author.all # returns an array of Artist objects
    # raise "hell"
  end
  def show
    @author = Author.find params[:id] # returns one Artist object
  end
  # UPDATE ##################################################
  def edit
    @author = Author.find params[:id]
  end
  def update
    @author = Author.find params[:id]
    @author.update author_params
    redirect_to author_path(@author.id)
  end



  #DELETE###########################################
    def destroy
    author = Author.find params[:id]
    author.destroy

    redirect_to(authors_path) #index page
    end




  # private
  # def author_params
  #   # This method ensures that the 'artist' key is set in the params hash, and then
  #   # makes sure only the permitted columns are taken from the form (and saved to the database)
  #   params.require(:author).permit( :name, :nationality, :dob)
  # end
end
