class Admin::BreedsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @breed = Breed.new
    @breeds = Breed.all
  end

  def create
    @breed = Breed.new(breed_params)
    if @breed.save
      redirect_to admin_breeds_path
    else
      @breeds = Breed.all
      redirect_to request.referer, alert: "同一の品種がすでに存在しています。確認後に再度登録してください"
    end
  end

  def edit
    @breed = Breed.find(params[:id])
  end

  def update
    @breed = Breed.find(params[:id])
    if @breed.update(breed_params)
      redirect_to admin_breeds_path, notice: "猫種を変更しました"
    else
      redirect_to request.referer, alert: "エラーが発生しました。"
    end
  end

  def destroy
    @breed = Breed.find(params[:id])
    @breed.destroy
    redirect_to admin_breeds_path
  end

  private

  def breed_params
    params.require(:breed).permit(:name)
  end

  def authenticate_admin!
    unless current_admin
      redirect_to root_path, alert: '不正な操作が行われました。'
    end
  end

end
