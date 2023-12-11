class User::ItemsController < ApplicationController
  def index
    @item = Item.new
    # @items = Items.all
  end

  def create
    @item = Items.new(item_params)
    if @item.save
      redirect_to user_items_path(@user)
    else
      render :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "updated"
      redirect_to user_items_path(@user)
    else
      render :index
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_items_path(@user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :product_url)
  end
end
