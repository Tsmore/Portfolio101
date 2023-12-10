class Cat < ApplicationRecord

  has_one_attached :profile_image

  belongs_to :user
  belongs_to :breed

end
