class User::NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.order(created_at: :desc)
  end

  def mark_as_read
    notification = Notification.find(params[:id])
    notification.update(checked: true)
    redirect_to request.referer
  end

end
