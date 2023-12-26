class User::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to request.referer, notice: 'コメントをしました'
    else
      redirect_to request.referer, alert: 'コメント出来ませんでした'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to request.referer, notice: 'コメントを削除しました'
    else
      redirect_to request.referer, alert: 'コメントの削除に失敗しました'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: '不正なアクセスです' unless @comment.user == current_user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
