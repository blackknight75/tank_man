class Nitrate < ApplicationRecord

  def self.get_nitrates(tank)
    tank.water_parameters.limit(31)
  end
end
