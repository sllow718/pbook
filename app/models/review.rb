class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  has_one_attached :photo
  has_many :review_flavors
end
