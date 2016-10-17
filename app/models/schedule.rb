class Schedule < ActiveRecord::Base
  has_one :teleporter
  belongs_to :departure, class_name: 'City'
  belongs_to :arrival, class_name: 'City'
  validates_associated :departure, :arrival
  validates_presence_of :departure, :arrival
  validate :departure_arrival_id_check
  validates :date, presence: true
  validates_date :date, :after => lambda { Date.today - 1.day },
                        before_message: 'must be reserved at least today'

  def departure_arrival_id_check
    errors.add(:arrival_id, "can't be the same as departure") if arrival_id == departure_id
  end
end