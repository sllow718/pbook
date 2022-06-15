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

    # get the hawkercenter
    @hawkercenter = HawkerCenter.find(@stall.hawker_center_id)
    # get all dishes in the same hawker center
    hawkercenter_stalls = Stall.where(hawker_center_id: @hawkercenter.id)
    # get the number 1 dish of each stall in the hawker center
    hawkercenter_dishes = []
    hawkercenter_stalls.each do |stall|
      dish = Dish.where(stall_id: stall.id).order('dishes.score DESC').first
      hawkercenter_dishes << dish
    end
    # get my rank within that hawker center
    @hawker_rank = hawkercenter_dishes.index(stall_best) + 1
    # get count of stalls in that hawker center
    @hawker_count = hawkercenter_dishes.count
    # get percentage
    @hawker_percentage = (@hawker_rank / @hawker_count).round * 100
  end
end
