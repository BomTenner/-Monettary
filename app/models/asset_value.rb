require 'json'
require 'open-uri'

class AssetValue < ApplicationRecord
  belongs_to :asset

  def self.add_today_values
    all_assets = Asset.all
    date = Date.today.strftime("%d-%m-%Y")

    all_assets.each do |asset|
      id = asset.name.downcase
      url = "https://api.coingecko.com/api/v3/coins/#{id}/history?date=#{date}&localization=en"
      data_serialized = URI.open(url).read
      data = JSON.parse(data_serialized)
      asset.update(price: data["market_data"]["current_price"]["eur"])
      new_value = AssetValue.create!(asset: asset, date: Date.today.strftime("%b %d,%Y"), value: data["market_data"]["current_price"]["eur"].round(2))
      puts "Asset Values added!"
    end
  end

  def self.test_job
    puts "did the job"
  end
end