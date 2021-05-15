class TransactionsController < ApplicationController

  def idnex
    @assets = Asset.all
    @addresses = Address.all
    @transactions = Transaction.all
  end

  def exchange

  end
end
