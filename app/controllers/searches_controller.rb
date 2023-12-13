class SearchesController < ApplicationController
  def index
    keyword = params[:keyword]
    if keyword.present?
      @posts = Post.where('title LIKE :keyword OR body LIKE :keyword', keyword: "%#{keyword}%")
      @users = User.where('username LIKE :keyword', keyword: "%#{keyword}%")
    else
      @posts = Post.all
      @users = User.all
    end
  end
end
