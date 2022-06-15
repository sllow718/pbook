class DashboardsController < ApplicationController
  def dashboard
    # overall analysis
    @stall = Stall.find_by(user_id: current_user.id)
    @hawkercenter = HawkerCenter.find(@stall.hawker_center_id)

    # item analysis
    name = "Yummy Lo Mee"
    @dish = Dish.where(stall_id: @stall.id, name: name).first
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
