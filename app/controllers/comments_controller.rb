class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
            flash[:success] = "Comment Create Successfully"
            redirect_to post_path(@post)
        else
            flash[:danger] = "Comment Failed"
            redirect_to post_path(@post)
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :parent_id)
    end

end