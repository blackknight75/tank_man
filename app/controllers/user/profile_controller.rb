class User::ProfileController < ApplicationController

  def show
    @tanks = Tank.where(user_id: params["id"])
  end

end
