class Teleporter < ActiveRecord::Base
  has_one :user
  has_one :schedule

  def self.get_teleporter_for_user
  end

  def self.get_user_for_teleporter
  end
end