class Card < ApplicationRecord
  belongs_to :user, optional: true
  
  with_options presence: true do
    validates :customer_id
    validates :paycard_id
  end
end
