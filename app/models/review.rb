class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  has_one_attached :photo
  has_many :review_flavors

  after_create :update_dish_score

  private

  def update_dish_score
    dish = Dish.find(self.dish_id)
    dish_reviews = dish.reviews.all
    scores = []
    dish_reviews.each do |review|
      scores << review.rating
    end
    score = scores.sum / scores.length
    dish.update!(score: score)
  end
end
