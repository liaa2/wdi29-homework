

class CarsController < ApplicationController

skip_before_action :verify_authenticity_token, raise: false

def index
  @cars = Car.all
end

def show
  @car = Car.find params[:id]
end


end
