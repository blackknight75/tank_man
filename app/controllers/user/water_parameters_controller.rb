class User::WaterParametersController < ApplicationController
 def create
   water = Tank.find(params[:tank_id]).waterParameter.new(strong_params)
   if water.save?
     redirect_to dashboard_path(current_user)
   end
 end



 private

 def strong_params
   params.require("water_parameter").permit(:ph, :nitrite, :nitrate, :ammonia, :water_change, :tank_id)
 end
end
