class User::FishController < ApplicationController

  def create
    fish = Tank.find(params[:tank_id]).fish.new(fish_params)
    binding.pry
    if fish.save
      flash[:success] = "Your tank was created successfully!"
      redirect_to dashboard_path(current_user)
    else
      redirect_to request.referer
    end
  end

  private

  def fish_params
    params.require(:fish).permit(:name, :breed, :image_url, :temperament, :description)
  end
end
