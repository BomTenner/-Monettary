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
    @transfer = Transaction.new
    @address = Address.find(params[:address_id])
  end
end
