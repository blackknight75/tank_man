class StoresController < ApplicationController
  before_action :check_registered_user

  def index
    @client_ip = cache("client-ip") { remote_ip }
    @stores = cache("store-pages") { Store.near_by_stores(@client_ip) }
    # @stores = Kaminari.paginate_array(Store.near_by_stores(@client_ip))
    #                   .page(params[:page])
    #                   .per(9)
  end

  def show
    @store = Store.store_details(params[:id])
  end
end
