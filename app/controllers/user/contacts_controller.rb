class User::ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id if user_signed_in?
    if @contact.save
      redirect_to request.referer, notice: "お問い合わせありがとうございます"
    else
      redirect_to request.referer, alert: "送信に失敗しました 再度お願いします"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :body, :name, :email)
  end

end
