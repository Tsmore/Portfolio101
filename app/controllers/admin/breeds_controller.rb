class Admin::BreedsController < ApplicationController
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
      render :index
    end
  end

  def update
    @breed = Breed.find(params[:id])
    if @breed.update(breed_params)
      redirect_to admin_breeds_path
    else
      @breeds = Breed.all
      render :index
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

end
