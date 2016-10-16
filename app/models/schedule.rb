class Schedule < ActiveRecord::Base
  has_many :cities
  validate :departure_arrival_id
  validates :date, presence: true

  def check_departure_and_arrival
    errors.add(:arrival_id, "can't be the same as departure") if arrival_id == departure_id
  end
end