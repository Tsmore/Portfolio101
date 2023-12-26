class User::ItemsController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    @item = Item.new
    @items = @user.items.page(params[:page]).per(10)
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to request.referer, notice: "使用アイテムを追加しました"
    else
      @items = current_user.items
      redirect_to request.referer, alert: "使用アイテムの追加に失敗しました"
    end
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to request.referer, notice: "#{@item.name} の内容を編集しました"
    else
      @items = current_user.items
      redirect_to request.referer, alert: "#{@item.name} の編集に失敗しました"
    end
  end

  def destroy
    @item = current_user.items.find_by(id: params[:id])
    if @item
      item_name = @item.name
      @item.destroy
      redirect_to request.referer, alert: "#{item_name} を削除しました"
    else
      redirect_to request.referer, alert: "不正なアクセスです"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :product_link)
  end
end
