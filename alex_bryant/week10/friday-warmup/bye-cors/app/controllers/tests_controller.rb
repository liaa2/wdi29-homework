class TestsController < ApplicationController

  def home

  end

  def index
    puts "++++++++++++++++++++++++++++++"
    puts params[:url]
    url = params[:url]

    unless url.present?
      render json: {}
      return
    end

    response = HTTParty.get url


    render json: {data: response.body}
  end

end
