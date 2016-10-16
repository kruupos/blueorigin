class API::CityController < ApplicationController
  def index
    render json: City.index 
  end
end
