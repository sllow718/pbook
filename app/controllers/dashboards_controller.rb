class DashboardsController < ApplicationController
  def dashboard
    # get all dishes ordered by score
    ranked_all_dishes = Dish.order('dishes.score DESC').all
    # get my stall
    @stall = Stall.find_by(user_id: current_user.id)
    # get all my dishes
    @stall_dishes = @stall.dishes
    # find my dish with the highest score
    stall_best = Dish.where(stall_id: @stall.id).order('dishes.score DESC').first
    # get that dish's rank
    @stall_best_rank = ranked_all_dishes.index(stall_best) + 1
    # get count of stalls
    @all_stalls_count = ranked_all_dishes.count
    # get percentage
    @percentage = (@stall_best_rank / @all_stalls_count).round * 100

    # get all dishes of the same dish_type
    # get my dish rank
    # get count of all same dish_type
  end
end
