class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[6.0]
  def change
    change_column :assets, :market_cap, :integer, limit: 8
  end
end
