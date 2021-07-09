class User < ApplicationRecord

  has_many :posts

  has_many :favPost
  has_many :favposts, through: :favPost, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :payment
  accepts_nested_attributes_for :payment
end
