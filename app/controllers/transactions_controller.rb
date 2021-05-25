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
    receiving_address = params[:receiving_address_id]
    if Address.exists?(address_sequence: receiving_address)
      @transaction.receiving_address = Address.find(receiving_address)
    end
    @transaction.save
  end

  private

  def transaction_params
    params.require(:transaction).permit(:sending_address_id, :receiving_amount, :sending_amount)
  end
end
