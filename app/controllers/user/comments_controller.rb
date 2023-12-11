class User::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to
    else
      render
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
