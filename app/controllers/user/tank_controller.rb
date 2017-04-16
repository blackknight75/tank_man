class User::TankController < ApplicationController


  def show
    @tank = Tank.find_by(params[:tank_id])
  end
end
