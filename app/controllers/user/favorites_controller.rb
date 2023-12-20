class User::FavoritesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def index
    @favorites = current_user.favorites.includes(:post)
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
    @post = Post.find(params[:post_id])
  end
end
