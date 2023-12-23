class User::AllCatsController < ApplicationController
  def index
    @cats = Cat.page(params[:page]).per(12)
  end
end
