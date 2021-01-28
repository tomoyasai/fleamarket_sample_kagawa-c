class Image < ApplicationRecord
  belongs_to :item
  validates :content, presence: true
end
