class StocksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stocks = current_company.stocks
    if params[:category_id].present?
      @stocks = @stocks.joins(:product).
        where('products.category_id' => params[:category_id])
    end
    @stocks = @stocks.all
  end
end
