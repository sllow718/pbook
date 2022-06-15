class Dish < ApplicationRecord
  belongs_to :stall
  has_one :hawker_center, :through => :stall
  has_many :reviews
  has_many :bookmarks
  has_one_attached :photo
  has_many :flavors, :through => :review_flavor, :through => :review

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name ],
  :associated_against => {
    :stall => [:name],
    :hawker_center => [:name]
  },
  using: {
    tsearch: { prefix: true }
  }

  # for staging
  def score(dish)
    dish_reviews = dish.reviews.all
    ratings = []
    dish_reviews.each do |review|
      ratings << review.rating
    end
    score = ratings.sum / ratings.length
    return score
  end
end
