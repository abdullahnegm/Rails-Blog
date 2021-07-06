class Post < ApplicationRecord 

    validates :title, presence: true, length: { in: 6..30 }
    validates :content, presence: true, length: { minimum: 10 }
    
end