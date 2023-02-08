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
    # @coins.each do |coin|
    #   coin.price = prices[coin.gecko_coin]['eur']
    #   coin.change = prices[coin.gecko_coin]['eur_24h_change']
    # end

    # créer la nouvelle liste des coins
    @dashboard = {}
    current_user.portfolios.all.each do |portfolio|
      c3 = {}
      total = 0
      @dashboard["#{portfolio.id}"] = {}
      c2 = current_user.coins.all.select do |c|
        c.portfolio_id == portfolio.id
      end

      c2.each do |coin|
        c3["#{coin.id}"] =
          { id: coin.id,
          portfolio_id: coin.portfolio_id,
          image_url: coin.image_url,
          name: coin.name,
          stock:  coin.stock,
          price: prices[coin.gecko_coin]['eur'],
          value: coin.stock * prices[coin.gecko_coin]['eur'] }
        total += coin.stock * prices[coin.gecko_coin]['eur']
      end

      # trier c3 par value DESC
      @dashboard["#{portfolio.id}"]["assets"] = c3
      @dashboard["#{portfolio.id}"]["total_ptf"] = total
    end

# fin créer
  end

  private

  def search_price(list)
    price_url = "https://api.coingecko.com/api/v3/simple/price?ids=#{list}&vs_currencies=EUR&include_24hr_change=true"
    price_serialized = URI.open(price_url).read
    JSON.parse(price_serialized)
  end

end
