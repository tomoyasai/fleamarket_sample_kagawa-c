class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address,dependent: :destroy
  accepts_nested_attributes_for :address
  
  has_one :card,dependent: :destroy
  has_many :buy_data
  has_many :items
  has_many :comments

# 以下、バリデーションの記述

  SEIKI01 = /\A[一-龥ぁ-ん]/
  SEIKI02 = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :encrypted_password, length: { minimum: 7 }
    validates :nick_name
    validates :birthday
    validates :family,format: { with: SEIKI01 }
    validates :first, format: { with: SEIKI01 }
    validates :family_kana,format: { with: SEIKI02 }
    validates :first_kana, format: { with: SEIKI02 }
  end
end
