class User::FavoritesController < ApplicationController
  before_action :set_post

  def index
  end

  def create
    @favorite = current_user.favorites.new(post_id: @post.id)
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
