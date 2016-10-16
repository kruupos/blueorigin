class HomeController < ApplicationController
  def index
    @cities = City.all
    @schedule = Schedule.new
    @user = User.new
  end
end
