# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Création des 100 premiers en market caps
# puts "creation coins de base..."
# # https://api.coingecko.com/api/v3/coins/markets?vs_currency=EUR&order=market_cap_desc&per_page=100&page=1&sparkline=false
# response :
# Response body
# Download
# [
#   {
#     "id": "bitcoin",
#     "symbol": "btc",
#     "name": "Bitcoin",
#     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
#     "current_price": 20022,
#     "market_cap": 382796451449,
#     "market_cap_rank": 1,
#     "fully_diluted_valuation": 419763241083,
#     "total_volume": 36807505000,
#     "high_24h": 20759,
#     "low_24h": 19971,
#     "price_change_24h": -736.9764078546323,
#     "price_change_percentage_24h": -3.55015,
#     "market_cap_change_24h": -14706666097.793762,
#     "market_cap_change_percentage_24h": -3.69976,
#     "circulating_supply": 19150618,
#     "total_supply": 21000000,
#     "max_supply": 21000000,
#     "ath": 59717,
#     "ath_change_percentage": -66.54438,
#     "ath_date": "2021-11-10T14:24:11.849Z",
#     "atl": 51.3,
#     "atl_change_percentage": 38845.9235,
#     "atl_date": "2013-07-05T00:00:00.000Z",
#     "roi": null,
#     "last_updated": "2022-09-14T18:22:52.099Z"
#   },
#   {
#     "id": "ethereum",
#     "symbol": "eth",
#     "name": "Ethereum"


#******************************************************
# Création de portfolios et coins

# puts "Destroying portfolios..."
# Portfolio.destroy_all
# puts "Creating portfolio 1..."
# p1 = Portfolio.new(
#   name: "KRAKEN",
#   user_id: 1
# )
# p1.save!

# puts "Creating coin 1..."
# Coin.create!(
#   gecko_coin: "bitcoin",
#   symbol: "BTC",
#   name: "Bitcoin",
#   image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
#   portfolio_id: p1.id,
#   stock: 1.1
# )
# puts "Creating coin 2..."
# Coin.create!(
#   gecko_coin: "ethereum",
#   symbol: "ETH",
#   name: "Ethereum",
#   image_url: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
#   portfolio_id: p1.id,
#   stock: 1.2
# )
# puts "Creating coin 3..."
# Coin.create!(
#   gecko_coin: "ripple",
#   symbol: "XRP",
#   name: "Ripple",
#   image_url: "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731",
#   portfolio_id: p1.id,
#   stock: 1.30
# )

# puts "Creating coin 4..."
# Coin.create!(
#   gecko_coin: "binancecoin",
#   symbol: "BNB",
#   name: "Binance Coin",
#   image_url: "https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850",
#   portfolio_id: p1.id,
#   stock: 1.4440
# )
# puts "Creating coin 5..."
# Coin.create!(
#   gecko_coin: "cardano",
#   symbol: "ADA",
#   name: "Cardano",
#   image_url: "https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860",
#   portfolio_id: p1.id,
#   stock: 1.5555
# )
# puts "Creating portfolio 2..."
# p2 = Portfolio.new(
#   name: "BINANCE",
#   user_id: 1
# )
# p2.save!
# puts "Creating coin 1..."
# Coin.create!(
#   gecko_coin: "bitcoin",
#   symbol: "BTC",
#   name: "Bitcoin",
#   image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
#   portfolio_id: p2.id,
#   stock: 2.1
# )
# puts "Creating coin 2..."
# Coin.create!(
#   gecko_coin: "ethereum",
#   symbol: "ETH",
#   name: "Ethereum",
#   image_url: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
#   portfolio_id: p2.id,
#   stock: 2.22
# )
# puts "Creating portfolio 3..."
# p3 = Portfolio.new(
#   name: "PTF3",
#   user_id: 1
# )
# p3.save!
# puts "Creating coin 1..."
# Coin.create!(
#   gecko_coin: "bitcoin",
#   symbol: "BTC",
#   name: "Bitcoin",
#   image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
#   portfolio_id: p3.id,
#   stock: 3.11
# )
# puts "Portfolios and coins finished!"
