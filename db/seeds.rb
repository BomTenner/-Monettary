require 'json'
require 'open-uri'

puts "Cleaning Transaction Database"
Transaction.destroy_all

puts "Cleaning Address Databse"
Address.destroy_all

puts "Cleaning Asset Databse"
Asset.destroy_all


puts "Finished cleaning"


all_coins = ["bitcoin","ethereum", "chainlink", "cardano", "dogecoin", "tezos", "polkadot", "uniswap", "litecoin", "solana", "stellar", "vechain"]

all_coins.each do |id|
  url = "https://api.coingecko.com/api/v3/coins/#{id}"
  coin_serialized = URI.open(url).read
  coin = JSON.parse(coin_serialized)
  puts "Seeding coin: #{coin["name"]}"
  Asset.create!([{name: coin["name"], price: coin["market_data"]["current_price"]["eur"], ticker: coin["symbol"], description: coin["description"]["en"], logo: coin["image"]["large"]}])
end

# Asset.create!([{name: "Bitcoin", price: 50000, ticker: "BTC", description: "The first ever digital asset", logo: "bitcoin.png"}])

# Asset.create!([{name: "Ethereum", price: 4000, ticker: "ETH", description: "The first smart contract platform", logo: "ethereum.png"}])

# Asset.create!([{name: "Chainlink", price: 40, ticker: "LINK", description: "The best oracle solution for interoparability", logo: "chainlink.png"}])

# Asset.create!([{name: "Cardano", price: 2, ticker: "ADA", description: "Scamcoin", logo: "cardano.png"}])

puts "Finished seeding assets"





