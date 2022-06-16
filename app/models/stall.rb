class Stall < ApplicationRecord
  belongs_to :user
  belongs_to :hawker_center
  has_many :dishes, dependent: :destroy
  has_one_attached :photo

  def best_dish
    Dish.where(stall_id: self.id).order('dishes.score DESC').first
  end

  def rank
    best = []
    Stall.all.each do |stall|
      if stall.best_dish.nil?
        puts "haha"
      else
        best << stall.best_dish
      end
    end
    # return best.count
    dishes_sorted = best.sort_by { |dish| dish.score }.reverse
    return dishes_sorted.index(self.best_dish) + 1
  end

  def rank_in_hawkercenter
    hawkercenter_stalls = Stall.where(hawker_center_id: self.hawker_center_id)
    hawkercenter_dishes = []
    hawkercenter_stalls.each do |stall|
      if stall.best_dish.nil?
        puts "haha"
      else
        hawkercenter_dishes << stall.best_dish
      end
    end
    hawker_stalls_sorted = hawkercenter_dishes.sort_by { |dish| dish.score }.reverse
    return hawker_stalls_sorted.index(self.best_dish) + 1
  end
end
