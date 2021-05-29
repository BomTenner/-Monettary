require 'json'
require 'open-uri'


# puts "Cleaning Address Databse"
# Address.destroy_all

# puts "Cleaning Transaction Database"
# Transaction.destroy_all


# puts "Cleaning Asset Databse"
# Asset.destroy_all

# puts "Finished cleaning"



# all_coins = ["bitcoin","ethereum", "chainlink", "cardano", "dogecoin", "tezos", "polkadot", "uniswap", "litecoin", "solana", "stellar", "vechain"]

# all_coins.each do |id|
#   url = "https://api.coingecko.com/api/v3/coins/#{id}"
#   coin_serialized = URI.open(url).read
#   coin = JSON.parse(coin_serialized)
#   puts "Seeding coin: #{coin["name"]}"
#   Asset.create!([{name: coin["name"], price: coin["market_data"]["current_price"]["eur"], ticker: coin["symbol"], description: coin["description"]["en"], logo: coin["image"]["large"]}])
# end


# puts "Finished seeding assets"

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




