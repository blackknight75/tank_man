class HomeController < ApplicationController

  def show
    @presenter = Presenter.new
    render :layout => false
  end
end
