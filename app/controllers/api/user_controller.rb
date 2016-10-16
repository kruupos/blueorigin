class API::UserController < ApplicationController
  def index
    render json: User.index 
  end
end
