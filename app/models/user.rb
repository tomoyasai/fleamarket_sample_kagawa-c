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
  #   validates :family, format: { with:/\A[一-龥ぁ-ん]/ }
  #   validates :first, format: { with:/\A[一-龥ぁ-ん]/ }
  #   validates :family_kana, format: { with:/\A[ァ-ヶー－]+\z/ }
  #   validates :first_kana, format: { with:/\A[ァ-ヶー－]+\z/ }
  # end
end
