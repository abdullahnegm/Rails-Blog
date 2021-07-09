class Post < ApplicationRecord 

    has_many :favPost
    has_many :favusers, through: :favPost, source: :user

    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { in: 6..30 }
    validates :content, presence: true, length: { minimum: 10 }

    # def is_favourite? current_user
    #     current_user.favposts.include?(self)
    # end
    
end