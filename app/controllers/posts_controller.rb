class PostsController < ApplicationController
    before_action :set_post , only: %i[edit update show destroy]
    before_action :require_permission , only: %i[edit update destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @posts = Post.all
        respond_to do |format|
            format.json { render json: {plz_work: "OK"} }
            format.html { render 'posts/index' }
        end
    end

    def show
        @comment = Comment.new
        @comments = Post.find(params[:id]).comments.where(parent_id: nil)
    end

    def edit
        @post = Post.new
        render template: "posts/form"
    end

    def update
        if @post.update(post_params)
            flash[:success] = "Post Edited Successfully"
            redirect_to @post
        else
            flash[:danger] = "Enter Valid data"
            render template: "posts/form"
        end
    end

    def new 
        @post = Post.new
        render template: "posts/form"
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            flash[:success] = "Post Created Successfully"
            redirect_to @post
        else
            flash[:danger] = "Enter Valid data"
            render template: "posts/form"
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end


    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def require_permission
        if current_user != @post.user
            redirect_to root_path
        end 
    end

end