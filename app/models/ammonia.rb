class Ammonia < ApplicationRecord

  def self.get_ammonia(tank)
    tank.water_parameters.limit(31)
  end
end
