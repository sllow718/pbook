class StallsController < ApplicationController
  def index
    @stalls = Stall.all
  end

  def show
    @stall = Stall.find(params[:id])
    @dishes = Dish.where("stall_id=?", @stall)
  end

  def new
    @stall = Stall.new
    @hawkers = HawkerCenter.all
    # @hawker_center_names = []
    # HawkerCenter.all.each do |hawker_center|
    #   @hawker_center_names << hawker_center.name
    # end
  end

  def create
    @stall = Stall.new(stall_params)
    @stall.user_id = current_user.id

    if @stall.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def stall_params
    params.require(:stall).permit(:name, :unit, :hawker_center_id, :description, :photo)
  end
end
