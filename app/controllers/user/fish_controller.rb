class User::FishController < ApplicationController

  def create
    fish = Tank.find(params[:tank_id]).fish.new(fish_params)
    default_image = "http://www.vectorportal.com/img_novi/fish-vector.jpg"
    fish.image_url = default_image if fish.image_url == ""
    if fish.save
      flash[:success] = "Your fish was added successfully!"
      redirect_to dashboard_path(current_user)
    else
      redirect_to request.referer
    end
  end

  def destroy
    fish = Fish.find(params[:id])
    fish.destroy
    redirect_to request.referer
  end

  private

  def fish_params
    params.require(:fish).permit(:name, :breed, :image_url, :temperament, :description, :tank_id)
  end
end
