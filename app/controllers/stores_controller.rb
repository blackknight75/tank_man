class StoresController < ApplicationController
  before_action :check_registered_user

  def index
    @client_ip = cache("client-ip") { remote_ip }
    @stores = cache("store-pages") { Store.near_by_stores(@client_ip) }
  end

  def show
    @store = Store.store_details(params[:id])
    @reviews = Review.where(place_id: @store.place_id)
  end
end
