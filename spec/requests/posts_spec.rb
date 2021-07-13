require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "[ Posts Index ] " do

    it "GET /index" do
      get root_path
      expect( response ).to have_http_status(200)
    end

    it "renders the index template" do
      get root_path
      expect( response ).to render_template("posts/index")
    end

    it "does not render a different template" do
      get root_path
      expect( response ).to_not render_template(:show)
    end
    
  end

  describe "[ Post Show ] " do
    
    before do 
      @user = User.create( username: "Abdullah", email: "abody@hotmail.com", password: "123456", password_confirmation: "123456" )
      @post = Post.new(title: 'Hello its me', content: 'Im the Content')
      @post.user = @user
      @post.save!
      get post_path(@post)
    end

    it "Get Show" do
      expect( response ).to have_http_status(200)
    end

    it "renders the show template" do
      expect( response ).to render_template("posts/show")
    end

    it "does not render a different template" do
      expect( response ).to_not render_template(:index)
    end

  end

end


