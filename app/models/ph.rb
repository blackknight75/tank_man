class Ph < ApplicationRecord

  def self.get_ph(tank)
    tank.water_parameters.limit(31)
  end
end
