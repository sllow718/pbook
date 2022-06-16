class Dish < ApplicationRecord
  belongs_to :stall
  has_one :hawker_center, :through => :stall
  has_many :reviews, dependent: :destroy
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

  def self.ranked
    Dish.order('dishes.score DESC').all
  end

  def rank
    Dish.ranked.index(self) + 1
  end

  def rank_per_type(dish_type)
    list = Dish.order('dishes.score DESC').where(dish_type: dish_type).all
    return list.index(self) + 1
  end

  def self.count_in_dish_type(dish_type)
    Dish.where(dish_type: dish_type).count
  end

  def self.type_average(dish_type)
    dishes = Dish.where("score > 0", dish_type: "#{dish_type}")
    dish_arr = []
    dishes.each do |dish|
      dish_arr << dish.score
    end
    return dish_arr.sum / dish_arr.length
  end

  def price_rank
    list = Dish.order('dishes.price DESC').where(dish_type: self.dish_type).all
    return list.index(self) + 1
  end

  def average_price
    dishes = Dish.where(dish_type: "#{self.dish_type}")
    dish_arr = []
    dishes.each do |dish|
      dish_arr << dish.price
    end
    return dish_arr.sum / dish_arr.length
  end

  def self.score_average
    dishes = Dish.where.not(score: 0)
    dish_arr = []
    dishes.each do |dish|
      dish_arr << dish.score
    end
    return dish_arr.sum / dish_arr.length
  end

  def type_flavors
    # join reviews to dishes where certain dish type
    # dish + dishtype -> review
    Dish.joins(:reviews).where(dish_type: "#{self.dish_type}").all
  end



end
