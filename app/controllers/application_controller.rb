class ApplicationController < ActionController::Base
  before_action :set_contact
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def set_contact
    @contact = Contact.new
  end

  def record_not_found
    redirect_to root_path, alert: '指定されたページが見つかりません。'
  end

  def authenticate_custom_user!
    unless user_signed_in?
      redirect_to root_path, alert: "ログインもしくはアカウントを登録してください。"
    end
  end

end
