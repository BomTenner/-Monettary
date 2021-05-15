class Transaction < ApplicationRecord
  belongs_to :sending_address, class_name: "Address", primary_key: "address_sequence", foreign_key: "sending_address"
  belongs_to :receiving_address, class_name: "Address", primary_key: 'address_sequence', foreign_key: "receiving_address", optional: true 
end
