class TransactionsController < ApplicationController

  def index
    @assets = Asset.all
    @addresses = Address.all
    @transactions = Transaction.all
  end

  def exchange

  end
end
