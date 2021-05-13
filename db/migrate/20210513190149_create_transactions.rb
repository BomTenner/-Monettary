class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :category
      t.float :receiving_amount
      t.float :sending_amount

      t.timestamps
    end
  end
end
