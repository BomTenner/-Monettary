class Address < ApplicationRecord
  belongs_to :user
  belongs_to :asset
  has_many :transactions

  validates_uniqueness_of :address_sequence
end
