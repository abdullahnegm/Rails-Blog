class User < ApplicationRecord

  validate :picture

  has_many :posts

  has_many :favPost
  has_many :favposts, through: :favPost, source: :post

  has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  has_many :messages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :payment
  accepts_nested_attributes_for :payment

  mount_uploader :picture, PictureUploader
end
