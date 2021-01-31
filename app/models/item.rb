class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_data
  has_many :images
  belongs_to :category
  has_many :comments
  mount_uploader :image, ImageUploader
  # validates :name, presence: true, uniqueness: true
  # validates :content, presence: true, unless: :image?


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status


end