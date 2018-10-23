class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    Author.create author_params
    redirect_to(authors_path)
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find params[:id]
  end

  def edit
    @author = Author.find params[:id]
  end

  def update
    @author = Author.find params[:id]
    @author.update author_params
    redirect_to(author_path(@author.id))

  end

  def destroy
    Author.find(params[:id]).delete
    redirect_to(authors_path)
  end

  private
  def author_params
    params.require(:author).permit(:name, :country, :dob, :genre, :image)
  end


end
