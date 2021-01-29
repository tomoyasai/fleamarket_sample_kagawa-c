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

  # validates :nick_name,presence: true

end
