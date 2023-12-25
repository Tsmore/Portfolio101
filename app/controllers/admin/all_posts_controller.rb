class Admin::AllPostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(12)
  end

  def show

  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path, notice: "投稿を削除しました"
    else
      redirect_to admin_posts_path, alert: "投稿の削除に失敗しました"
    end
  end
end
