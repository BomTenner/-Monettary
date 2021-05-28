require 'json'
require 'open-uri'
require 'date'

class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    session[:additional_infos] ||= {}
    update_assets if session[:additional_infos] == {}
    @assets = Asset.all
    @belongings = []
    @total = 0
    @charts_data = []

    @user.addresses.each do |address|
      crypto = {
        address: address,
        name: address.asset.name,
        logo: address.asset.logo,
        ticker: address.asset.ticker,
        balance: address.balance,
        value: address.balance * address.asset.price,
      }
      chart_point = [
        address.asset.name,
        address.balance * address.asset.price,
    ]
      @belongings << crypto
      @charts_data << chart_point
    end

    @belongings.each do |belonging|
      @total += belonging[:value]
    end
  end

  def update_assets
    assets = Asset.all
    last_updated = Asset.last.updated_at
    now = Time.now
    diff = now - last_updated
      if (diff > 100 )
      assets_names = assets.map { |asset| asset.name.downcase}
      assets_names.each do |id|
        url = "https://api.coingecko.com/api/v3/coins/#{id}"
        hist_url = "https://api.coingecko.com/api/v3/coins/#{id}/market_chart?vs_currency=eur&days=10&interval=daily"
        coin_serialized = URI.open(url).read
        history_serialized = URI.open(hist_url).read
        coin = JSON.parse(coin_serialized)
        history = JSON.parse(history_serialized)
        asset = Asset.select { |asset| asset.name == coin["name"]}[0]
        asset.update(price: coin["market_data"]["current_price"]["eur"])
        iterator = 10
        tod = Date.today
        hist_with_dates = []
        history["prices"].each do |price|
          point = [
            (tod - iterator).strftime("%b %d,%Y"),
            price[1] = price[1].round(2)
          ]
          hist_with_dates << point
          iterator -= 1
        end
        session[:additional_infos][asset.name] = hist_with_dates
        p session[:additional_infos]
      end
    end
  end


end
