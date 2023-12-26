class Admin::AllCommentsController < ApplicationController

  def index
    @comments = Comment.order(created_at: :desc).page(params[:page]).per(12)
  end
end
