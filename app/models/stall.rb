class Stall < ApplicationRecord
  belongs_to :user
  belongs_to :hawker_center
  has_many :dishes, dependent: :destroy
  has_one_attached :photo

  def best_dish
    Dish.where(stall_id: self.id).order('dishes.score DESC').first
  end

  def rank
    top = Dish.where(stall_id: self.id).order('dishes.score DESC').first
    Dish.ranked.index(top) + 1
  end
end
