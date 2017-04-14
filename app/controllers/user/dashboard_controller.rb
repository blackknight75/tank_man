class User::DashboardController < ApplicationController
  def show
    @tanks = Tank.where(user_id: current_user.id)
  end
end
