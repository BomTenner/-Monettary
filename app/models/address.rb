class Address < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  validates_uniqueness_of :address_sequence
end
