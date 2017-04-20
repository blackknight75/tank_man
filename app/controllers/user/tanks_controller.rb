class User::TanksController < ApplicationController


  def show
    @tank = Tank.find_by(params[:tank_id])
  end

  def create
    tank = User.find(current_user.id).tanks.new(tank_params)
    tank.image_url = "https://img.clipartfox.com/71ff7f2524a3f53a539fc565e92850ba_fish-tank-wallpapers-hd-fish-tank-clipart-hd_1072-816.jpeg" if tank.image_url == ""
    if tank.save
      flash[:success] = "Your tank was created successfully!"
      redirect_to request.referer
    end
  end

  private

  def tank_params
    params.require(:tank).permit(:name, :image_url, :description, :style)
  end
end
