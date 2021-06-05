require 'json'
require 'open-uri'

# ###############################
# un-comment below if you need to re seed Assets completely
# ###############################

puts "Cleaning Address Databse"
Address.destroy_all

puts "Cleaning Transaction Database"
Transaction.destroy_all


puts "Cleaning Asset Databse"
Asset.destroy_all

puts "Finished cleaning"



all_coins = ["bitcoin","ethereum", "chainlink", "cardano", "dogecoin", "tezos", "polkadot", "uniswap", "litecoin", "solana", "stellar", "vechain"]

all_coins.each do |id|
  url = "https://api.coingecko.com/api/v3/coins/#{id}"
  coin_serialized = URI.open(url).read
  coin = JSON.parse(coin_serialized)
  puts "Seeding coin: #{coin["name"]}"
  Asset.create!([{
      name: coin["name"],
      price: coin["market_data"]["current_price"]["eur"],
      ticker: coin["symbol"].capitalize,
      description: coin["description"]["en"],
      logo: coin["image"]["large"],
      coingecko_rank: coin["coingecko_rank"] ,
      market_cap: coin["market_data"]["market_cap"]["eur"] ,
      price_change_percentage_24h: coin["market_data"]["price_change_percentage_24h"],
      price_change_percentage_7d: coin["market_data"]["price_change_percentage_7d"],
  }])
end

puts "Finished seeding assets"



################################
# un-comment below if you need to seed AssetValue = historical value
################################

puts "Cleaning AssetValue Databse"
AssetValue.destroy_all


puts "Finished cleaning"

all_assets = Asset.all
tod = Date.today

all_assets.each do |asset|
  id = asset.name.downcase

  hist_url = "https://api.coingecko.com/api/v3/coins/#{id}/market_chart?vs_currency=eur&days=10&interval=daily"
  history_serialized = URI.open(hist_url).read
  history = JSON.parse(history_serialized)
  iterator = 10

  history["prices"].each do |price|
    new_value = AssetValue.create!(asset: asset, date: (tod - iterator).strftime("%b %d,%Y"), value: price[1].round(2))
    iterator -= 1
  end
  puts "Asset Values added!"
end

puts "Finished seeding asset values"



################################
# un-comment below if you need to update Assets with the new values (new columns for Asset#show page)
################################


all_existing_coins = Asset.all

all_existing_coins.each do |asset|
  id = asset.name.downcase
  url = "https://api.coingecko.com/api/v3/coins/#{id}"
  coin_serialized = URI.open(url).read
  coin = JSON.parse(coin_serialized)
  puts "Seeding additional data for coin: #{coin["name"]}"
  asset.update!({
      coingecko_rank: coin["coingecko_rank"] ,
      market_cap: coin["market_data"]["market_cap"]["eur"] ,
      price_change_percentage_24h: coin["market_data"]["price_change_percentage_24h"],
      price_change_percentage_7d: coin["market_data"]["price_change_percentage_7d"],
  })
end

puts "Finished seeding additional data for assets"





