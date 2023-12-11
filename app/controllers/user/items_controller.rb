class User::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = current_user.items
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = "使用製品を追加しました"
      redirect_to user_items_path(current_user)
    else
      @items = current_user.items
      flash[:alert] = "使用製品の追加に失敗しました"
      render :index
    end
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "#{@item.name} の内容を更新しました"
      redirect_to user_items_path(current_user)
    else
      @items = current_user.items
      flash[:alert] = "#{@item.name} の更新に失敗しました"
      render :index
    end
  end

  def destroy
    @item = Item.find(params[:id])
    item_name = @item.name
    @item.destroy
    flash[:alert] = "#{item_name} を削除しました"
    redirect_to user_items_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :product_link)
  end
end
