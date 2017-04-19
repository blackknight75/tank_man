class Tank < ApplicationRecord
  belongs_to :user

  def self.new_tank
    Tank.new
  end
end
