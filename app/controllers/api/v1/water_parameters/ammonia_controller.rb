class Api::V1::WaterParameters::AmmoniaController < ApplicationController

  def index
    @ammonia_readings = (Tank.find(ammonia_params[:tank_id])).get_recent_ammonia
    render json: @ammonia_readings, each_serializer: AmmoniaSerializer
  end

  private

  def ammonia_params
    params.permit(:tank_id)
  end
end
