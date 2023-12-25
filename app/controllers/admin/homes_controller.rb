class Admin::HomesController < ApplicationController
  def top
    @contacts = Contact.all.order(created_at: :desc).where(is_checked: :false).limit(3)
    @reports = Report.all.order(created_at: :desc).where(processed: :false).limit(3)
  end
end
