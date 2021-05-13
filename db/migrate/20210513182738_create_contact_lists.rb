class CreateContactLists < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :user_1, null: false
      t.references :user_2, null: false

      t.timestamps
    end

    add_foreign_key "contacts", "users", column: "user_1_id"
    add_foreign_key "contacts", "users", column: "user_2_id"
  end
end
