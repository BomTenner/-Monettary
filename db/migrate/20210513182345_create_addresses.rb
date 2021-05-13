class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.float :balance
      t.string :address_sequence

      t.timestamps
    end

    add_index :addresses, :address_sequence, unique: true
  end
end
