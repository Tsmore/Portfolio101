class User::FavoritesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def index
    @favorites = current_user.favorites.joins(:post).merge(Post.from_active_users).page(params[:page]).per(8)
  end

  def create
    @favorite = current_user.favorites.build(post_id: @post.id)
    @favorite.save
    render 'fav'
  end

  def destroy
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    render 'fav'
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
    redirect_to root_path, alert: "投稿が見つかりません" if @post.nil?
  end
end
