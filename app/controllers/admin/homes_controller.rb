class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @contacts = Contact.all.order(created_at: :desc).where(is_checked: :false).limit(3)
    @reports = Report.all.order(created_at: :desc).where(processed: :false).limit(3)
  end
  
  private

  def authenticate_admin!
    unless current_admin
      redirect_to root_path, alert: '不正な操作が行われました。'
    end
  end
  
end
