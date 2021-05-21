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
    @exchange = Transaction.new(exchange_params)
    @exchange.category = "exchange"
    @exchange.save

    redirect_to new_exchange_path
  end

  private

  def exchange_params
    params.require(:transaction).permit(:sending_address_id, :receiving_address_id, :receiving_amount, :sending_amount)
  end
end
