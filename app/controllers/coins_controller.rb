class CoinsController < ApplicationController
  require "open-uri"

  def index
  end

  def show
  end

  def new
    @coin = Coin.new
  end

  def create
    @coin = Coin.new(coin_params)
    @coin.portfolio = current_portfolio
    @coin.stock = 0
    if @coin.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def coin_params
    params.require(:coin).permit(:gecko_coin, :name, :symbol, :image_url)
  end


end

#  données à créer
#   gecko_coin: "bitcoin",
#   symbol: "BTC",
#   name: "Bitcoin",
#   image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
#   portfolio_id: p3.id,
#   stock: 0
