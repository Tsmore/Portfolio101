class User::AllCatsController < ApplicationController
  def index
    @cats = Cat.all
  end
end
