class Breed < ApplicationRecord

  has_many :cats

  validates :name, presence: true, uniqueness: true
end
