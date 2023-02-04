class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  require "open-uri"

  def about
  end

  def home
  # préparer la liste des gecko_coin
  # appeler l'API
  # associer le price à chaque coin
  # a faire :
    # envoyer à la view un hash avec uniquement les données nécessaires
      # ptf coin
      # ptf_id coin_id logo symbol name ptf_id stock price + la value de la ligne
      # cela permettra de supprimer les données prix de la DB,
      # et d'optimiser le code de home.html.erb
    # trier les coins par valeur décroissante dans chaque ptf

    @portfolios = current_user.portfolios.all
    @coins = current_user.coins.all
    list = "#{@coins.first.gecko_coin}"
    @coins.each do |coin|
      list = "#{list},#{coin.gecko_coin}"
    end
    prices = search_price(list)
    @coins.each do |coin|
      coin.price = prices[coin.gecko_coin]['eur']
      coin.change = prices[coin.gecko_coin]['eur_24h_change']
    end
  end

  private

  def search_price(list)
    price_url = "https://api.coingecko.com/api/v3/simple/price?ids=#{list}&vs_currencies=EUR&include_24hr_change=true"
    price_serialized = URI.open(price_url).read
    JSON.parse(price_serialized)
  end

end
