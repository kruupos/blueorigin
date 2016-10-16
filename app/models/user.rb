class User < ActiveRecord::Base
  belongs_to :teleporters
  validates :name, length: { minimum: 2 }, uniqueness: { case_sensitive: false }, presence: true

  def summary
    as_json(only: %i(id name)).symbolize_keys
  end

  def self.index
    all.map(&:summary)
  end
end