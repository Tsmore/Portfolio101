class User::RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  before_action :authenticate_user!

  def create
    current_user.follow(@user)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to request.referer
  end

  def index
    @user = User.find(params[:user_id])
    @following = @user.following.active.page(params[:page]).per(12)
    @followers = @user.followers.active.page(params[:page]).per(12)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end