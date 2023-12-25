class Admin::ContactsController < ApplicationController

  def index
    @contacts = Contact.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.is_checked = !@contact.is_checked

    if @contact.save
      redirect_to admin_contact_path(@contact), notice: 'ステータスが更新されました'
    else
      redirect_to admin_contact_path(@contact), alert: 'ステータスの更新に失敗しました'
    end
  end

end
