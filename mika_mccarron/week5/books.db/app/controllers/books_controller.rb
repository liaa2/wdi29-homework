class BooksController < ApplicationController

  skip_before_action :verify_authenticity_token, raise:false

  #CREATE part 1 : blank form
  def new
  end

  #CREATE part 2: submit form
  def create
  Book.create(
    title:params[:title],
    author:params[:author],
    published_year:params[:published_year],
    image:params[:image],
  )
   #CREATE has no template
   #redirect to index page
  redirect_to( books_path )
  end


  #READtype 1: Index for all itmes in 'planets'
  def index
    @books = Book.all #Get all rows in the plannets table
  end

  #READ type 2: show page, details for one item.
  def show
    #gets us one row, and returns it as an object
    @book = Book.find params[:id]
  end

  #UPDATE
  def edit
    @book = Book.find params[:id]
  end

  def update
    book = Book.find params[:id]
    book.update(
      title:params[:title],
      author:params[:author],
      published_year:params[:published_year],
      image:params[:image]
    )
    #redirect to the show page for the planet #we just updated
    redirect_to(book_path(book.id))
  end

  def destroy
    book = Book.find params[:id]
    book.destroy

    redirect_to( books_path )
  end

end # class
