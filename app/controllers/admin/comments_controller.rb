class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer, notice: 'コメントが削除されました'
  end
end
