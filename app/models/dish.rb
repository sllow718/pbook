class Dish < ApplicationRecord
  belongs_to :stall
  has_many :reviews
  has_many :bookmarks
end
