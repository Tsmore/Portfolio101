class Notification < ApplicationRecord

  default_scope -> { order(created_at: :decs) }

  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :favorite, optional: true
  belongs_to :relationship, optional: true

end
