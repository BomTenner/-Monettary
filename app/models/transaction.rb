class Transaction < ApplicationRecord
  belongs_to :sending_address, class_name: "Address", primary_key: "address_sequence", foreign_key: "sending_address_id"
  belongs_to :receiving_address, class_name: "Address", primary_key: 'address_sequence', foreign_key: "receiving_address_id", optional: true
  attr_accessor :assets
end
