class Cat < ApplicationRecord

  has_one_attached :cat_image

  def profile_image
    unless cat_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      cat_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    cat_image
  end

  belongs_to :user
  belongs_to :breed

  enum sex: {male: 1, female: 2, unknown: 3 }

  validates :name, presence: true
  validates :introduction, presence: true
  validates :sex, presence: true

end
