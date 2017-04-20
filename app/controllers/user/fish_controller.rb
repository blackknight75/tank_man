class User::FishController < ApplicationController

  def create
    fish = Tank.find(params[:format]).fish.new(fish_params)
    if fish.save
      flash[:success] = "Your fish was added successfully!"
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
