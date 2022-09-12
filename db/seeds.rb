# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying portfolios..."
Portfolio.destroy_all
puts "Creating portfolio 1..."
p1 = Portfolio.new(
  name: "KRAKEN",
  user_id: 1
)
p1.save!

puts "Creating coin 1..."
Coin.create!(
  gecko_coin: "bitcoin",
  symbol: "BTC",
  name: "Bitcoin",
  image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  portfolio_id: p1.id,
  stock: 1.1
)
puts "Creating coin 2..."
Coin.create!(
  gecko_coin: "ethereum",
  symbol: "ETH",
  name: "Ethereum",
  image_url: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
  portfolio_id: p1.id,
  stock: 1.2
)
puts "Creating coin 3..."
Coin.create!(
  gecko_coin: "ripple",
  symbol: "XRP",
  name: "Ripple",
  image_url: "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731",
  portfolio_id: p1.id,
  stock: 1.30
)

puts "Creating coin 4..."
Coin.create!(
  gecko_coin: "binancecoin",
  symbol: "BNB",
  name: "Binance Coin",
  image_url: "https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850",
  portfolio_id: p1.id,
  stock: 1.4440
)
puts "Creating coin 5..."
Coin.create!(
  gecko_coin: "cardano",
  symbol: "ADA",
  name: "Cardano",
  image_url: "https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860",
  portfolio_id: p1.id,
  stock: 1.5555
)
puts "Creating portfolio 2..."
p2 = Portfolio.new(
  name: "BINANCE",
  user_id: 1
)
p2.save!
puts "Creating coin 1..."
Coin.create!(
  gecko_coin: "bitcoin",
  symbol: "BTC",
  name: "Bitcoin",
  image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  portfolio_id: p2.id,
  stock: 2.1
)
puts "Creating coin 2..."
Coin.create!(
  gecko_coin: "ethereum",
  symbol: "ETH",
  name: "Ethereum",
  image_url: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
  portfolio_id: p2.id,
  stock: 2.22
)
puts "Creating portfolio 3..."
p3 = Portfolio.new(
  name: "PTF3",
  user_id: 1
)
p3.save!
puts "Creating coin 1..."
Coin.create!(
  gecko_coin: "bitcoin",
  symbol: "BTC",
  name: "Bitcoin",
  image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  portfolio_id: p3.id,
  stock: 3.11
)
puts "Finished!"
