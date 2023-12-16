class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :create_notification

  private

  def create_notification
    Notification.create(
      visitor_id: self.follower_id,
      visited_id: self.following_id,
      notifiable: self,
      action: 'followed'
    ) unless self.follower_id == self.following_id
  end

end
