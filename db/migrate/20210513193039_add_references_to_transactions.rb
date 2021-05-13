class AddReferencesToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :receiving_address, :string
    add_column :transactions, :sending_address, :string

    add_foreign_key :transactions, :addresses, column: :receiving_address, primary_key: :address_sequence
    add_foreign_key :transactions, :addresses, column: :sending_address, primary_key: :address_sequence
  end
end
