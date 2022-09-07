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
Portfolio.create!(
  name: "Kraken",
  user_id: 1
)
puts "Creating coin 1..."
Coin.create!(
  gecko_coin: "bitcoin",
  symbol: "btc",
  name: "Bitcoin",
  image_url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
  portfolio: 1,
  stock: 2
)
puts "Finished!"
