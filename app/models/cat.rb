class Cat < ApplicationRecord

  has_one_attached :cat_image

  belongs_to :user
  belongs_to :breed

  enum sex: {male: 1, female: 2}

end
