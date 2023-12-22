class Contact < ApplicationRecord

  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true
  validates :email, presence: true, if: -> { user.blank? }

end
