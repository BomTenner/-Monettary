class TransactionsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        assets.name ILIKE :query \
        OR assets.ticker ILIKE :query \
      "
      query_addresses = Address.joins(:asset).where(sql_query, query: "%#{params[:query]}%")
      @addresses = query_addresses.select{ |add| add.user == current_user}
    else
      @addresses = Address.all.select{ |add| add.user == current_user}
    end

    crypto_hash
  end

  def new
    @addresses = Address.all
    @assets = Asset.all
    @transaction = Transaction.new
    @asset = Asset.find(params[:asset_id])
    @contact = Contact.new
    @friends = Contact.all
    @asset_addresses = Address.where(asset_id: @asset.id)
    @infos = {}
    @asset_addresses.each do |add|
      @infos[add.address_sequence] = add.balance
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.category = "transaction"
    sending_amount = params[:transaction][:sending_amount].to_f
    receiving_amount = 0

    receiving_address = params[:transaction][:receiving_address_id]
    sending_address = Address.find_by(address_sequence: params[:transaction][:sending_address_id])
    old_balance = sending_address.balance
    new_balance = old_balance - sending_amount + receiving_amount
    sending_address.update!(balance: new_balance)
    if Address.exists?(address_sequence: receiving_address)
      @transaction.update!(receiving_address: Address.find_by(address_sequence: receiving_address))
    end
    @transaction.save
  end

  def show
    @transaction = Transaction.where(exchange)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:sending_address_id, :receiving_amount, :sending_amount)
  end

  def crypto_hash
    @assets_ids = @addresses.map do |address|
      address.asset.id
    end

    @crypto_hash = []

    @unique_assets = @assets_ids.uniq # [17, 18, 19]

    @unique_assets.each do |uniq_asset|
      @addresses_subset = Address.where(asset_id: uniq_asset)
      @balance = []
      @addresses_subset.each do |address|
        @balance << address.balance
      end
      @final_balance = @balance.sum.round(2)
      asset = Asset.find(uniq_asset)
      asset_id = asset.id
      asset_name = asset.name
      asset_price = asset.price
      asset_ticker = asset.ticker
      @crypto_hash << { id: asset_id, name: asset_name, balance: @final_balance, price: asset_price, ticker: asset_ticker }
    end
  end
end
