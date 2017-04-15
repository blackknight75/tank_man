class StoreSearchController < ApplicationController

  def index
    @stores = Store.near_by_stores_search(search_params[:zipcode])
    render '/stores/index'
  end

  private

  def search_params
    params.permit(:zipcode)
  end
end
