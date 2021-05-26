class TransactionsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        assets.name ILIKE :query \
        OR assets.ticker ILIKE :query \
      "
      @addresses = Address.joins(:asset).where(sql_query, query: "%#{params[:query]}%")
    else
      @addresses = Address.all
    end
  end

  def new
    @addresses = Address.all
    @transaction = Transaction.new
    @address = Address.find(params[:address_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)

    sending_amount = params[:transaction][:sending_amount].to_f
    receiving_amount = params[:transaction][:receiving_amount].to_f

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
