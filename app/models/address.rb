class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  # 以下、バリデーションの記述
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{7}\z/ }
    validates :prefecture_id
    validates :city
    validates :block_number
  end
end
