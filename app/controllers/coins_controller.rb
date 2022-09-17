class CoinsController < ApplicationController
  require "open-uri"

  def index
    @search = params["search"]
    if @search.present?
      chaine = @search["name"]
      trouve = call_api(chaine)
      for i in (0...trouve["coins"].length)
        name = trouve["coins"][i]["name"]
        symbol = trouve["coins"][i]["symbol"]
        @coin = Coin.new
        coin.name = name
        coin.symbol = symbol
        # comment envoyer à la view?
      end
    end

  end

  def show
  end

  def new
    @coin = Coin.new

  end

  def create
    @coin = Coin.new(coin_params)
    if @portfolio.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def coin_params
    params.require(:coin).permit(:name)
  end

  def call_api(chaine)
    searchcoin_url = "https://api.coingecko.com/api/v3/search?query=#{chaine}"
    searchcoin_serialized = URI.open(searchcoin_url).read
    JSON.parse(searchcoin_serialized)
  end

end

#  données à créer
#   gecko_coin: "bitcoin",
#   symbol: "BTC",
#   name: "Bitcoin",
#   image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
#   portfolio_id: p3.id,
#   stock: 0
