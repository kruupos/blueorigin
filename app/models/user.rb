class User < ActiveRecord::Base
  has_one :teleporter
  validates :name,  presence: true,
                    length: { minimum: 2 }, 
                    uniqueness: { case_sensitive: false }

  def name=(s)
    write_attribute(:name, s.to_s.capitalize)
  end

  def summary
    as_json(only: %i(id name)).symbolize_keys
  end

  def self.index
    all.map(&:summary)
  end
end