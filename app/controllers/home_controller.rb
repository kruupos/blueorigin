class HomeController < ApplicationController
  def index
    @user = User.new
    @schedule = Schedule.new
    @teleporter = Teleporter.new
  end
end
