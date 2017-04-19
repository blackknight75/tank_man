class HomeController < ApplicationController
  before_action :guest_user

  def show
    @presenter = Presenter.new
    render :layout => false
  end
end
