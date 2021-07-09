class FavPostsController < ApplicationController

    def index
        @posts = current_user.favposts
        render 'posts/index'
    end

    def favourite
        @post = Post.find( params[:id] )
        current_user.favposts.delete(@post)
        redirect_to root_path
    end

    def unfavourite
        @post = Post.find( params[:id] )
        current_user.favposts.push(@post)
        redirect_to root_path
    end


end