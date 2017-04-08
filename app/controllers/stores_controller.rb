class StoresController < ApplicationController

  def index
    @stores = Store.near_by_stores
  end
end
