class ScheduleController < ApplicationController
  def create
    @user = User.find_or_create_by(name: params[:user])

    #@schedule.create(arrival_id: params[:])
    flash[:truc] = params
    if (@user.valid? and @user.save)
      flash[:notice] = "Some text indicating it was created"
    else
      flash[:error] = @user.errors.messages.first
    end
    redirect_to :back
  end
end
