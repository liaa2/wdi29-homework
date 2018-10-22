class FuturesController<ApplicationController

#create
  def new
    @future =Future.new  #create blank object for form_for helper to use
  end

  def create
    Future.create future_params
    redirect_to(futures_path)
  end

#read
  def index
    @futures = Future.all
  end

  def show
    @future = Future.find params[:id]
  end

#update
  def edit
    @future = Future.find params[:id]
  end

  def update
    @future = Future.find params[:id]
    @future.update future_params
    redirect_to future_path(@future.id)
  end

#delete
  def destroy
    future = Future.find params[:id]
    puts future
    future.destroy
    redirect_to futures_path
  end


  private

  def future_params
    params.require(:future).permit(:name, :year, :location, :image)
  end

end
