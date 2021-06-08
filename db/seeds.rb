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



# all_coins = ["bitcoin","ethereum", "chainlink", "cardano", "dogecoin", "tezos", "polkadot", "uniswap", "litecoin", "solana", "stellar", "vechain"]

# all_coins.each do |id|
#   url = "https://api.coingecko.com/api/v3/coins/#{id}"
#   coin_serialized = URI.open(url).read
#   coin = JSON.parse(coin_serialized)
#   puts "Seeding coin: #{coin["name"]}"
#   Asset.create!([{
#       name: coin["name"],
#       price: coin["market_data"]["current_price"]["eur"],
#       ticker: coin["symbol"].capitalize,
#       description: coin["description"]["en"],
#       logo: coin["image"]["large"],
#       coingecko_rank: coin["coingecko_rank"] ,
#       market_cap: coin["market_data"]["market_cap"]["eur"] ,
#       price_change_percentage_24h: coin["market_data"]["price_change_percentage_24h"],
#       price_change_percentage_7d: coin["market_data"]["price_change_percentage_7d"],
#   }])
# end

# puts "Finished seeding assets"



################################
# un-comment below if you need to seed AssetValue = historical value
################################

# puts "Cleaning AssetValue Databse"
# AssetValue.destroy_all


puts "Finished cleaning"



# all_assets = Asset.all
# tod = Date.today






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






