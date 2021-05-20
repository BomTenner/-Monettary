class ExchangesController < ApplicationController

  def index
    @assets = Asset.all
    @addresses = Address.all
    @exchanges = Transaction.where(category: "exchange")
  end

  def new
    @assets = Asset.all
    @exchange = Transaction.new
    @addresses = current_user.addresses.select(:address_sequence, :balance, :asset_id).group_by { |address| address.asset.id }
  end

  def create

  end
end
