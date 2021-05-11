class Address < ApplicationRecord
  belongs_to :user
  belongs_to :asset
  has_many :transactions, class_name: "Transaction", foreign_key: :sending_address
  self.primary_key = 'address_sequence' 

  validates_uniqueness_of :address_sequence
end
