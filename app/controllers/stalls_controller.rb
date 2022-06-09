class StallsController < ApplicationController
  def index
    @stalls = Stall.all
  end

  def show
    @stall = Stall.find(params[:id])
    @dishes = Dish.where("stall_id=?", @stall)
  end
end
