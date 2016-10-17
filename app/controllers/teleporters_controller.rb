class TeleportersController < ApplicationController
  def create
    @user = User.find_by(user_params)
    if @user.nil?
      @user = User.new(user_params)
      @user.save if @user.valid?
    end

    if schedule_params[:date].empty?
      @schedule = Schedule.new
    else
      @schedule = Schedule.find_by(schedule_params)
      if @schedule.nil?
        @schedule = Schedule.new(schedule_params)
        @schedule.save if @schedule.valid?
      end
    end

    @teleporter = Teleporter.new(user_id: @user.id, schedule_id: @schedule.id)

    unless (@teleporter.valid? and @teleporter.save)
      render 'home/index'
    else
      redirect_to('home/index', notice: @teleporter.success_text)
    end
  end

private

  def user_params
    params.require(:user).permit(:name)
  end

  def schedule_params
    params.require(:schedule).permit(:departure_id, :arrival_id, :date)
  end


end
