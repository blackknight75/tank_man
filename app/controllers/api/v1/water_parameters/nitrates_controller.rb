class Api::V1::WaterParameters::NitratesController < ApplicationController

  def index
    @nitrate_readings = (Tank.find(nitrate_params[:tank_id])).get_recent_nitrates
    render json: @nitrate_readings, each_serializer: NitrateSerializer
  end

  private

  def nitrate_params
    params.permit(:tank_id)
  end
end
