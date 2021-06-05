class Asset < ApplicationRecord
  has_many :addresses
  has_many :asset_values

  def balance_for_user(user)
    Address.where(asset_id: self.id, user_id: user.id).pluck(:balance).sum
  end

  def individual_balances_for_user(user)
    Address.where(asset_id: self.id, user_id: user.id).pluck(:balance).each_with_index.map do |balance, index|
      ["Wallet #{index + 1} (Available balance: #{balance})", balance]
    end
  end
end
