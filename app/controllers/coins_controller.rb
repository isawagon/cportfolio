class CoinsController < ApplicationController
  require "open-uri"

  def index
  end

  def new
  end

  def show
  end

  private

  def search_price(coin)
    price_url = "https://api.coingecko.com/api/v3/simple/price?ids=#{coin.gecko_coin}&vs_currencies=EUR&include_24hr_change=true"
    price_serialized = URI.open(price_url).read
    JSON.parse(price_serialized)
  end
end
