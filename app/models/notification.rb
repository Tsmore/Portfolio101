class Notification < ApplicationRecord

  belongs_to :favorite
  belongs_to :message
  belongs_to :relationship
  belongs_to :comment

end
