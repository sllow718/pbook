class DashboardsController < ApplicationController
  def dashboard
    @stall = Stall.find_by(user_id: current_user.id)

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


  def getdish
    # clicked_dish = Dish.find(params[:id])

    respond_to do |format|
      format.json # Follow the classic Rails flow and look for a create.json view
    end
    # # app/views/reviews/create.json.jbuilder

  end
end
# dish_id = params[:dish_id]
# render json: { response: "ok", id_post: dish_id }, status: 200
