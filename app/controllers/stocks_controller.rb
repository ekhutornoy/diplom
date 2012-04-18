class StocksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stocks = Stock.page(params[:page])
  end
end
