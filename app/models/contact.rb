class Contact < ApplicationRecord
  belongs_to :user_1, class_name: 'User'
end
