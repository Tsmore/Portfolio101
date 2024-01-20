class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
  end

  def inactive
    @user = User.find(params[:id])
    @user.is_active = !@user.is_active
    if @user.save
      redirect_to request.referer, notice: "#{@user.username}のステータスが更新されました。"
    else
      redirect_to request.referer, alert: "#{@user.username}のステータスの更新に失敗しました。"
    end
  end

  def destroy
    @user = User.find(params[:id])
    user_name = @user.username
    if @user.destroy
      redirect_to admin_users_path, notice: "#{user_name}を削除しました"
    else
      redirect_to admin_users_path, alert: "#{user_name}の削除に失敗しました"
    end
  end

  private

  def authenticate_admin!
    unless current_admin
      redirect_to root_path, alert: '不正な操作が行われました。'
    end
  end

end
