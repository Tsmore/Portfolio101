class User::CatsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @cat = Cat.new
    @cats = @user.cats
  end

  def create
    @cat = current_user.cats.build(cat_params)
    if @cat.save
      flash[:notice] = "added"
      redirect_to user_cats_path(current_user)
    else
      @cats = current_user.cats
      render :index
    end
  end

  def update
    @cat = current_user.cats.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = "update"
      redirect_to user_cats_path(current_user)
    else
      @cats = current_user.cats
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
