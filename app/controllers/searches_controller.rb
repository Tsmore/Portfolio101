class SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @search_type = params[:search_type] || 'all'

    if @keyword.present?
      if @search_type == 'users'
        @users = User.where('username LIKE :keyword', keyword: "%#{@keyword}%")
        @posts = []
        render 'user/users/index' and return
      elsif @search_type == 'posts'
        @posts = Post.where('title LIKE :keyword OR body LIKE :keyword', keyword: "%#{@keyword}%")
        @users = []
        @tags = Tag.all
        render 'user/all_posts/index' and return
      else
        @posts = Post.where('title LIKE :keyword OR body LIKE :keyword', keyword: "%#{@keyword}%")
        @users = User.where('username LIKE :keyword', keyword: "%#{@keyword}%")
      end
    else
      if @search_type == 'users'
        @users = User.all
        render 'user/users/index' and return
      elsif @search_type == 'posts'
        @posts = Post.all
        @tags = Tag.all
        render 'user/all_posts/index' and return
      else
        @users = User.all
        @posts = Post.all
      end
    end
  end
end
