class User::RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    current_user.follow(@user)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to request.referer
  end

  def following
    user = User.find(params[:user_id])
    @users = user.following
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end