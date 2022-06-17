class DashboardsController < ApplicationController
  def dashboard
    # overall analysis
    @stall = Stall.find_by(user_id: current_user.id)
    @hawkercenter = HawkerCenter.find(@stall.hawker_center_id)

    # item analysis
    name = @stall.dishes.first.name
    @dish = Dish.where(stall_id: @stall.id, name: name).first

    @dish_type = @dish.dish_type
  end


  def getdish
    @dish = Dish.find(params[:id])

    respond_to do |format|
      format.json
    end

  end
end
# dish_id = params[:dish_id]
# render json: { response: "ok", id_post: dish_id }, status: 200
