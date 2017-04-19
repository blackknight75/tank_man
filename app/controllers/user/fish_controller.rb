class User::FishController < ApplicationController

  def create
    fish = Fish.new(fish_params)
    if fish.save
      redirect_to 'dashboard/current_user.id'
    else
      redirect_to 'dashboard/current_user.id'
    end
  end

  private

  def fish_params
  end
end
