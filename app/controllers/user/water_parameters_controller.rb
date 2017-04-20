class User::WaterParametersController < ApplicationController
 def create
   require "pry"; binding.pry
   WaterParameter.new(strong_params)
 end



 private

 def strong_params
   params.require(:waterparameters).permit(:ph, :nitrite, :nitrat, :ammonia, :water_change, :tank_id)
 end
end
