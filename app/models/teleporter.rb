class Teleporter < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  validates_associated :user, :schedule
  validates_presence_of :user, :schedule
  validates :user_id, uniqueness: { scope: :schedule_id }
  validate :check_if_full

  def check_if_full
    errors.add(:user_id, 'teleporter is full already') if Teleporter.count(schedule_id: schedule_id) > 4
  end

  def success_text
    user.name + ' is registered to teleport (him/her)self from ' + \
    schedule.arrival.name + ' to ' + \
    schedule.departure.name + ' the ' + \
    schedule.date.strftime('%Y-%m-%d') + \
    ' Passengers onboard are: ' + \
    find_all_passengers
  end

  def find_all_passengers
    Teleporter.where(schedule_id: schedule_id)
              .joins("LEFT join users u on user_id = u.id")
              .pluck("u.name")
              .to_sentence
  end
end