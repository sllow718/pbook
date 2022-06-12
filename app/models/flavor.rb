class Flavor < ApplicationRecord
  has_many :review_flavors
  belongs_to :dish
end
