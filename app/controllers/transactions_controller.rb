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
  end

  def new
    @addresses = Address.all
    @transaction = Transaction.new
    @address = Address.find(params[:address_id])
    @contact = Contact.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

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

  private

  def transaction_params
    params.require(:transaction).permit(:sending_address_id, :receiving_amount, :sending_amount)
  end
end
