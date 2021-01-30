class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  # # 以下、バリデーションの記述とちゅう
  # with_options presence: true do
  #   validates :post_code
  #   validates :prefecture_id
  #   validates :
  #   validates :
  #   validates :
  #   validates :

  #   validates :tel
  #   validates :building_name
  # end
end
