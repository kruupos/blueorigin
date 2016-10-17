class City < ActiveRecord::Base
  has_one :departure, class_name: 'Schedule', foreign_key: 'departure_id'
  has_one :arrival, class_name: 'Schedule', foreign_key: 'arrival_id'
  validates :name, uniqueness: { scope: :country, case_sensitive: false },
                   presence: true
  validates :country, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  
  def name=(s)
    write_attribute(:name, s.to_s.capitalize)
  end

  def country=(s)
    write_attribute(:country, s.to_s.capitalize)
  end

  def summary
    as_json(only: %i(id name country)).symbolize_keys
  end

  def self.index
    all.map(&:summary)
  end
end