class City < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  
  def summary
    as_json(only: %i(id name country)).symbolize_keys
  end

  def self.index
    all.map(&:summary)
  end
end