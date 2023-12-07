class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  has_many :notifications, dependent: :destroy
  has_many :reports, as: :reportable

end
