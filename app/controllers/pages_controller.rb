class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  require "open-uri"

  def home
    @portfolios = current_user.portfolios.all
    @coins = current_user.coins.all
    @coins.each do |coin|
      prices = search_price(coin)
      coin.price = prices[coin.gecko_coin]['eur']
      coin.change = prices[coin.gecko_coin]['eur_24h_change']
      # coin.save!
    end
  end

  private

  def search_price(coin)
    price_url = "https://api.coingecko.com/api/v3/simple/price?ids=#{coin.gecko_coin}&vs_currencies=EUR&include_24hr_change=true"
    price_serialized = URI.open(price_url).read
    JSON.parse(price_serialized)
  end

end
