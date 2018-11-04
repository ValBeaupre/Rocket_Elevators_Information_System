class User < ApplicationRecord
  has_many :customers
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end 
