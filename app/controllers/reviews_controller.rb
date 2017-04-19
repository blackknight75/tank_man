class ReviewsController < ApplicationController
   skip_before_filter :verify_authenticity_token

  def create
    Review.create!(place_id: params["store"], body: params["review"], score: params["stars"], user_id: current_user.id)
    redirect_to "/stores/#{params["store"]}"
  end
end
