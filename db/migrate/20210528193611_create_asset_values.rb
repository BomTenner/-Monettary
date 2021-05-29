class CreateAssetValues < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_values do |t|
      t.datetime :date
      t.float :value
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
