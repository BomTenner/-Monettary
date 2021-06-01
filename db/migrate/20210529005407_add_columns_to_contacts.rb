class AddColumnsToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :address_sequence, :string
  end
end
