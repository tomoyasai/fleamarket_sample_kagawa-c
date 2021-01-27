class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_data
  has_many :images
  belongs_to :category
  has_many :comments
end
