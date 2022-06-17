class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  has_one_attached :photo
  has_many :review_flavors

  after_create :update_dish_score

  def by_dish_type(dish_type)
  end

  private

  def update_dish_score
    dish = Dish.find(self.dish_id)
    dish_reviews = dish.reviews.all
    scores = []
    dish_reviews.each do |review|
      if review.rating.nil?
        scores << 0
      else
        scores << review.rating
      end
    end
    score = scores.sum / scores.length
    dish.update!(score: score)
  end
end
