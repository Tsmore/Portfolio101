class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room

  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :message, presence: true

  after_create :create_notification

  private

  def create_notification
    entries = self.room.entries.where.not(user_id: self.user_id)

    entries.each do |entry|
      Notification.create(
        visitor_id: self.user_id,
        visited_id: entry.user_id,
        notifiable: self,
        action: 'messaged'
      )
    end
  end

end
