require 'json'
require 'open-uri'
require 'date'

class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @assets = Asset.all
    @belongings = []
    @total = 0
    @charts_data = []
    @additional_infos = get_hist_values
    @user.addresses.each do |address|
      if (@belongings.any? { |x| x[:name] == address.asset.name } ) 
      crypto =  @belongings.select {|x| x[:name] == address.asset.name }[0]
      crypto[:address] << address
      crypto[:nb_add] += 1
      crypto[:balance] += address.balance
      crypto[:value] += address.balance * address.asset.price
      else
        crypto = {
          address: [address],
          nb_add: 1,
          name: address.asset.name,
          logo: address.asset.logo,
          ticker: address.asset.ticker,
          balance: address.balance,
          value: address.balance * address.asset.price,
        }
        @belongings << crypto
      end
    end

    @belongings.each do |belonging|
      chart_point = [
        belonging[:name],
        belonging[:value],
      ]
      @charts_data << chart_point
      @total += belonging[:value]
    end
  end

  def confirmation
    @exchange = Transaction.find(params[:transaction_id])
    @sending_currency = Address.all.select { |add| add.address_sequence == @exchange.sending_address_id}[0].asset.ticker
    @receiving_currency = Address.all.select { |add| add.address_sequence == @exchange.receiving_address_id}[0].asset.ticker
  end

  def get_hist_values
    hist_values = {}
    all_values = AssetValue.all
    all_assets = Asset.all

    all_assets.each do |asset|
      related_values = all_values.select { |value| value.asset == asset}
      all_old = []
      related_values.each do |value|
        my_arr = [
          value.date,
          value.value
        ]
        all_old << my_arr
      end
      hist_values[asset.name] = all_old
    end
    hist_values = hist_values
    return hist_values
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
        coin_serialized = URI.open(url).read
        coin = JSON.parse(coin_serialized)
        asset = Asset.select { |asset| asset.name == coin["name"]}[0]
        asset.update(price: coin["market_data"]["current_price"]["eur"])

        hist_url = "https://api.coingecko.com/api/v3/coins/#{id}/market_chart?vs_currency=eur&days=10&interval=daily"
        history_serialized = URI.open(hist_url).read
        history = JSON.parse(history_serialized)
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
