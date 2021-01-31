class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address
  # has_one :address,dependent: :destroy
  # dependent: :destroyは親モデルが消えると子モデルも消えるリレーションなので、
  # あとで適用させておくこと
  accepts_nested_attributes_for :address
  
  has_one :card,dependent: :destroy
  has_many :buy_data
  has_many :items
  has_many :comments

# 以下、バリデーションの記述とちゅう
  # with_options presence: true do
  #   validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  #   validates :encrypted_password, length: { minimum: 7 }
  #   validates :nick_name, uniqueness: true
  #   validates :birthday
  #   with_options format: { with:/\A[一-龥ぁ-ん]/ } true do
    #   validates :family
    #   validates :first
    # end
    # with_options format: { with:/\A[ァ-ヶー－]+\z/ } true do
    #   validates :family_kana
    #   validates :first_kana
    # end
  # end
end
