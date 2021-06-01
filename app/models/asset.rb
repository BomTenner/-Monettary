class Asset < ApplicationRecord
  has_many :addresses
  has_many :asset_values
end
