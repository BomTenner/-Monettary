class Address < ApplicationRecord
  belongs_to :user
  belongs_to :asset
  has_many :sending_transactions, class_name: "Transaction", foreign_key: "address_sequence", primary_key: "sending_address"
  has_many :receiving_transactions, class_name: "Transaction", foreign_key: 'address_sequence', primary_key: "receiving_address"
  self.primary_key = 'address_sequence' 

  validates_uniqueness_of :address_sequence

  def +(other)
    self.balance + other.balance
  end

end
