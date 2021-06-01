class AddColumnsToAssets < ActiveRecord::Migration[6.0]
  def change
    add_column :assets, :coingecko_rank, :integer
    add_column :assets, :market_cap, :integer
    add_column :assets, :price_change_percentage_24h, :float
    add_column :assets, :price_change_percentage_7d, :float
  end
end
