class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_data
  # has_many :images
  belongs_to :category
  has_many :comments
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true, uniqueness: true
  validates :info, presence: true
  validates :category, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_days_id, presence: true
  validates :user_id, presence: true
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status


end
