# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Databse"

Asset.destroy_all

puts "Finished cleaning"

puts "Create new Asets"

Asset.create!([{name: "Bitcoin", price: 50000, ticker: "BTC", description: "The first ever digital asset", logo: "bitcoin.png"}])

Asset.create!([{name: "Ethereum", price: 4000, ticker: "ETH", description: "The first smart contract platform", logo: "ethereum.png"}])

Asset.create!([{name: "Chainlink", price: 40, ticker: "LINK", description: "The best oracle solution for interoparability", logo: "chainlink.png"}])

Asset.create!([{name: "Cardano", price: 2, ticker: "ADA", description: "Scamcoin", logo: "cardano.png"}])

puts "Finished seeding assets"
