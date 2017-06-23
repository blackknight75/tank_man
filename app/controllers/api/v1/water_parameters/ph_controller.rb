class Api::V1::WaterParameters::PhController < ApplicationController

  def index
    @ph_readings = (Tank.find(ph_params[:tank_id])).get_recent_ph
    render json: @ph_readings, each_serializer: PhSerializer
  end

  private

  def ph_params
    params.permit(:tank_id)
  end
end
