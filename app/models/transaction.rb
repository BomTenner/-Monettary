class Transaction < ApplicationRecord
  belongs_to :sending_address, class_name: "Address", primary_key: 'address_sequence' 
end
