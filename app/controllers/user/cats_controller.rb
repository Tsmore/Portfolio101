class User::CatsController < ApplicationController
  before_action :set_cat, only: [:update, :destroy]
  before_action :authorize_user!, only: [:update, :destroy]
  before_action :authenticate_custom_user!

  def index
    @user = User.find(params[:user_id])
    @cat = Cat.new
    @cats = @user.cats.page(params[:page]).per(12)
  end

  def create
    if current_user.username == "GuestUser"
      redirect_to request.referer, alert: "GuestUserのため、登録は許可されていません"
    else
      @cat = current_user.cats.build(cat_params)
      if @cat.save
        redirect_to request.referer, notice: "#{@cat.name}を登録しました"
      else
        @cats = current_user.cats
        redirect_to request.referer, alert: "登録に失敗しました"
      end
    end
  end

  def update
    if current_user.username == "GuestUser"
      redirect_to request.referer, alert: "GuestUserのため、編集は許可されていません"
    else
      @cat = current_user.cats.find(params[:id])
      if @cat.update(cat_params)
        redirect_to request.referer, notice: "#{@cat.name}を編集しました"
      else
        @cats = current_user.cats
        redirect_to request.referer, alert: "#{@cat.name}の編集に失敗しました"
      end
    end
  end

  def destroy
    if current_user.username == "GuestUser"
      redirect_to request.referer, alert: "GuestUserのため、削除は許可されていません"
    else
      @cat = Cat.find(params[:id])
      cat_name = @cat.name
      @cat.destroy
      redirect_to request.referer, alert: "#{cat_name}の登録を解除しました"
    end
  end

  private

  def set_cat
    @cat = current_user.cats.find_by(id: params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "不正なアクセスです" if @cat.nil?
  end

  def cat_params
    params.require(:cat).permit(:name, :breed_id, :cat_image, :introduction, :date_of_birth, :sex)
  end

end
