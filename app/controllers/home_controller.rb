class HomeController < ApplicationController
  def index
    @schedule = Schedule.new
    @user = User.new
  end
end
