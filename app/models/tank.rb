class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_many :water_parameters

  def self.new_tank
    Tank.new
  end

  def self.new_fish
    Fish.new
  end

  def self.new_water_parameters
    WaterParameter.new
  end
end
