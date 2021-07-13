require 'rails_helper'

RSpec.describe "Post", type: :model do
  
  describe "Create comment" do
    it do
      @user = User.create( username: "Abdullah", email: "abody@hotmail.com", password: "123456", password_confirmation: "123456" )
      @post = Post.new(title: 'Hello its me', content: 'Im the Content')
      @post.user = @user
      comment = @post.comments.new(content: "Hello this is a comment")
      expect( @post.comments ).to include(comment)
    end
  end

  

end
