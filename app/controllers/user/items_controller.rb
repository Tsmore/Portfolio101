class User::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @item = Item.new
    @items = @user.items.page(params[:page]).per(10)
  end

  def create
    if current_user.username == "GuestUser"
      redirect_to request.referer, alert: "GuestUserのため、登録は許可されていません"
    else
      @item = current_user.items.build(item_params)
      if @item.save
        redirect_to request.referer, notice: "使用アイテムを追加しました"
      else
        @items = current_user.items
        redirect_to request.referer, alert: "使用アイテムの追加に失敗しました"
      end
    end
  end

  def update
    if current_user.username == "GuestUser"
      redirect_to request.referer, alert: "GuestUserのため、編集は許可されていません"
    else
      @item = current_user.items.find(params[:id])
      if @item.update(item_params)
        redirect_to request.referer, notice: "#{@item.name} の内容を編集しました"
      else
        @items = current_user.items
        redirect_to request.referer, alert: "#{@item.name} の編集に失敗しました"
      end
    end
  end

  def destroy
    if current_user.username == "GuestUser"
      redirect_to request.referer, alert: "GuestUserのため、削除は許可されていません"
    else
      @item = current_user.items.find_by(id: params[:id])
      if @item
        item_name = @item.name
        @item.destroy
        redirect_to request.referer, alert: "#{item_name} を削除しました"
      else
        redirect_to request.referer, alert: "不正なアクセスです"
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :product_link)
  end
end
