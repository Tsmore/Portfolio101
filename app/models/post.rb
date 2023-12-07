class Post < ApplicationRecord

  belongs_to :user

  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, as: :reportable

  has_and_belongs_to_many :tags

end
