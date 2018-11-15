class PagesController < ApplicationController

  def fetch
    # Actually go and get the page contents; HTTParty makes a request that looks like
    # a standard browser request, so there's no problem retrieving the page
    url = params[:url]
    # raise 'hell'
    unless url.present?
      render json: {}
      return
    end

    response = HTTParty.get url
    # To send a structured JSON response, need to render response.body to get the body of the content (Read the httparty gem documentation).
    render json: {data: response.body}

  end

  #we don't need to create the home method, just need the view page. Set the home page as root path
  # def home
  # end

end
