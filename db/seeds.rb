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
  name: "Kraken",
  user_id: 1
)
p1.save!

puts "Creating coin 1..."
Coin.create!(
  gecko_coin: "bitcoin",
  symbol: "btc",
  name: "Bitcoin",
  image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  portfolio_id: p1.id,
  stock: 2
)
puts "Creating coin 2..."
Coin.create!(
  gecko_coin: "ethereum",
  symbol: "eth",
  name: "Ethereum",
  image_url: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
  portfolio_id: p1.id,
  stock: 3.5
)
puts "Creating portfolio 2..."
p2 = Portfolio.new(
  name: "Binance",
  user_id: 1
)
p2.save!
puts "Creating coin 1..."
Coin.create!(
  gecko_coin: "bitcoin",
  symbol: "btc",
  name: "Bitcoin",
  image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  portfolio_id: p2.id,
  stock: 0.1
)
puts "Creating coin 2..."
Coin.create!(
  gecko_coin: "ethereum",
  symbol: "eth",
  name: "Ethereum",
  image_url: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
  portfolio_id: p2.id,
  stock: 4
)
puts "Finished!"
