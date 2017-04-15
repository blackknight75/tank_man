class StoresController < ApplicationController
  before_action :check_registered_user

  def index
    @stores = Store.near_by_stores
  end

  def show
    @store = Store.store_details(params[:id])
    
  end
end
