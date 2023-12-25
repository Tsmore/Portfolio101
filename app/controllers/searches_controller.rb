class SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @search_type = params[:search_type] || 'all'

    if @keyword.present?
      # users/index
      if @search_type == 'users'
        @users = User.where('username LIKE :keyword', keyword: "%#{@keyword}%").active.page(params[:page]).per(8)
        @posts = []
        render 'user/users/index' and return
      # all_posts/index
      elsif @search_type == 'posts'
        @posts = Post.where('title LIKE :keyword OR body LIKE :keyword', keyword: "%#{@keyword}%").from_active_users.page(params[:page]).per(5)
        @users = []
        @tags = Tag.all
        render 'user/all_posts/index' and return
      else
      # searches/index
        @posts = Post.where('title LIKE :keyword OR body LIKE :keyword', keyword: "%#{@keyword}%").from_active_users.page(params[:page]).per(5)
        @users = User.where('username LIKE :keyword', keyword: "%#{@keyword}%").active.page(params[:page]).per(8)
      end
    else
      if @search_type == 'users'
        @users = User.active.page(params[:page]).per(12)
        render 'user/users/index' and return
      elsif @search_type == 'posts'
        @posts = Post.from_active_users.page(params[:page]).per(5)
        @tags = Tag.all
        render 'user/all_posts/index' and return
      else
        @users = User.active.page(params[:page]).per(12)
        @posts = Post.from_active_users.page(params[:page]).per(5)
      end
    end
  end
end
