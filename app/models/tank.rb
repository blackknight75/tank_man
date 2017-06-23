class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_many :water_parameters

  def new_tank
    Tank.new
  end

  def new_fish
    Fish.new
  end

  def new_water_parameters
    WaterParameter.new
  end

  def fish_count
    fish.count
  end

  def get_recent_ph
    # binding.pry
    Ph.get_ph(self)
    # water_parameters.limit(31)
  end
end
