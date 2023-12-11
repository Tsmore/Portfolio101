class User::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = current_user.items
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = "created"
      redirect_to user_items_path(current_user)
    else
      @items = current_user.items
      render :index
    end
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "updated"
      redirect_to user_items_path(current_user)
    else
      @items = current_user.items
      render :index
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_items_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :product_link)
  end
end
