class User::CatsController < ApplicationController
  def index
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      flash[:notice] = "added"
      redirect_to user_cats_path(current_user)
    else
      render :index
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = "update"
      redirect_to user_cats_path(current_user)
    else
      render :index
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to user_cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed_id, :cat_image, :introduction, :date_of_birth, :sex)
  end
end
