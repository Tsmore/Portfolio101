class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :create_notification

  private

  def create_notification
    Notification.create(
      visitor_id: self.user_id,
      visited_id: self.post.user_id,
      notifiable: self,
      action: 'liked'
    ) unless self.user_id == self.post.user_id
  end

end
