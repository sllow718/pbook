class Dish < ApplicationRecord
  belongs_to :stall
  has_many :reviews
  has_many :bookmarks
  has_one_attached :photo
  has_many :flavors, :through => :review_flavor, :through => :review


  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name],
  using: {
    tsearch: { prefix: true }
  }
end
