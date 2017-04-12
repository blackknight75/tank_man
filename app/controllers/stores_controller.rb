class StoresController < ApplicationController
  before_action :check_registered_user

  def index
    @stores = Store.near_by_stores
  end
end
