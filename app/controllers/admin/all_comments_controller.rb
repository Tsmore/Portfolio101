class Admin::AllCommentsController < ApplicationController

  def index
    @comments = Comment.page(params[:page]).per(12)
  end
end
