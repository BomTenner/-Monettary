class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
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
end
