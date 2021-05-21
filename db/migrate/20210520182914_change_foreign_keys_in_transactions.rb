class ChangeForeignKeysInTransactions < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :receiving_address, :receiving_address_id
    rename_column :transactions, :sending_address, :sending_address_id
  end
end
