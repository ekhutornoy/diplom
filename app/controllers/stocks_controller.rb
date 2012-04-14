class StocksController < ApplicationController
  def index
    @stocks = Stock.page(params[:page])
  end
end
