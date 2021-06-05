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
    @my_assets = []
    @addresses.each do |id|
      @my_assets << Asset.find(id[0])
    end
    @my_assets
    @exchanges = Transaction.where(category: "exchange")
    @asset_hash = {}
    @assets.each do |asset|
      @asset_hash[asset.id] = { name: asset.name.capitalize, ticker: asset.ticker.upcase, price: asset.price }
    end
  end

  def create
    @exchange = Transaction.new(exchange_params)
    if (params[:transaction][:receiving_address_id] == "No address yet")
      sequence = (0...20).map { ('a'..'z').to_a[rand(26)] }.join
      new_add = Address.create!(user: current_user, asset: Asset.find(params[:transaction][:assets]), balance:params[:transaction][:receiving_amount], address_sequence: sequence )
      @exchange.receiving_address = new_add

    else
      p "else"
      receiving_add = Address.all.select { |add| add.address_sequence == params[:transaction][:receiving_address_id]}[0]
      p "receiving add #{receiving_add}"
      new_balance = receiving_add.balance + params[:transaction][:receiving_amount].to_f 
      p "receiving add balance #{receiving_add.balance}"
      receiving_add.update!(balance: new_balance)
      @exchange.receiving_address = receiving_add

    end

    sending_add = Address.all.select { |add| add.address_sequence == params[:transaction][:sending_address_id]}[0]
    p "sending add #{sending_add}"
    sending_add.balance -= params[:transaction][:sending_amount].to_f 
    sending_add.save

    @exchange.category = "exchange"
    @exchange.save!
    p @exchange
    redirect_to trans_confirmation_path(transaction_id: @exchange.id)
  end

  private

  def exchange_params
    params.require(:transaction).permit(:sending_address_id, :receiving_address_id, :receiving_amount, :sending_amount)
  end
end
