class RemoveUser2FromContacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :user_2_id
  end
end
