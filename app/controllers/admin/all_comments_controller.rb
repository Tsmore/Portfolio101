class Admin::AllCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.order(created_at: :desc).page(params[:page]).per(12)
  end

  private

  def authenticate_admin!
    unless current_admin
      redirect_to root_path, alert: '不正な操作が行われました。'
    end
  end

end
