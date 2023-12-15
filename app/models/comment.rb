class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :reports, as: :reportable

  validates :body, presence: true, length: { maximum: 140 }

end
