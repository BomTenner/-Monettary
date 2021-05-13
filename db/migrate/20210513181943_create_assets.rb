class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.float :price
      t.string :logo
      t.string :ticker
      t.text :description

      t.timestamps
    end
  end
end
