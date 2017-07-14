class Api::V1::WaterParameters::TemperatureController < ApplicationController

  def index
    @temperature_readings = (Tank.find(temperature_params[:tank_id])).recent_temperature
  end
end
