class SchedulesController < ApplicationController
  def create
    @user = User.find_or_create_by(user_params)
    @schedule = Schedule.new(schedule_params)

    unless (@user.save and @schedule.save)
      render 'home/index'
    else
      flash[:notice] = success_text
      redirect_to :back
    end  
  end

private

  def success_text
    arrival = City.find_by(id: @schedule.departure_id)
    departure = City.find_by(id: @schedule.arrival_id)
    "" + @user.name + "is registered to teleport himself from "  + arrival.name + "to " + departure.name + "the " @schedule.date
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def schedule_params
    params.require(:schedule).permit(:departure_id, :arrival_id, :date)
  end
end
