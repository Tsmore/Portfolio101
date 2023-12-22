class User::CatsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @cat = Cat.new
    @cats = @user.cats
  end

  def create
    @cat = current_user.cats.build(cat_params)
    if @cat.save
      redirect_to request.referer, notice: "#{@cat.name}を登録しました"
    else
      @cats = current_user.cats
      redirect_to request.referer, alert: "登録に失敗しました"
    end
  end

  def update
    @cat = current_user.cats.find(params[:id])
    if @cat.update(cat_params)
      redirect_to request.referer, notice: "#{@cat.name}を編集しました"
    else
      @cats = current_user.cats
      redirect_to request.referer, alert: "#{@cat.name}の編集に失敗しました"
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    cat_name = @cat.name
    @cat.destroy
    redirect_to request.referer, alert: "#{cat_name}の登録を解除しました"
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed_id, :cat_image, :introduction, :date_of_birth, :sex)
  end

end
