class CoinsController < ApplicationController
  def index
    @portfolios = current_user.portfolios.all
  
    @coins = Coin.where(portfolio_id: 1)
  end

  def show
  end

end
