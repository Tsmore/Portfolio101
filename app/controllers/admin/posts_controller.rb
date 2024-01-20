class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
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
  
  private

  def authenticate_admin!
    unless current_admin
      redirect_to root_path, alert: '不正な操作が行われました。'
    end
  end
  
end
