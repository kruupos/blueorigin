class Schedule < ActiveRecord::Base
  has_many :cities
  validates :date, presence: true
  #validates :city, presence: true
  validate :departure_arrival_id_check

  def departure_arrival_id_check
    errors.add(:arrival_id, "can't be the same as departure") if arrival_id == departure_id
  end
end