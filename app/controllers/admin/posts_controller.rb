class Admin::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_all_posts_path, notice: "投稿を削除しました"
  end
end
