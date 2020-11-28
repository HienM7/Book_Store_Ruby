class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable  
  has_one :shopping_cart
  has_many :order
end
