class Admin::AllPostsController < ApplicationController
  before_action :authenticate_admin!

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
  
  private

  def authenticate_admin!
    unless current_admin
      redirect_to root_path, alert: '不正な操作が行われました。'
    end
  end
  
end
