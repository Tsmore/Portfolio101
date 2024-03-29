class User::BookmarksController < ApplicationController
  before_action :authenticate_custom_user!

  def index
    @bookmarks = current_user.bookmarks.joins(:post).merge(Post.from_active_users).page(params[:page]).per(8)
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @post = @bookmark.post
    if @bookmark.valid?
      @bookmark.save
    end
    render 'bookmarks'
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @post = @bookmark.post
    @bookmark.destroy
    render 'bookmarks'
  end

  private

  def bookmark_params
    params.permit(:post_id)
  end
end
