class StocksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stocks = current_company.stocks.page(params[:page])
  end
end
