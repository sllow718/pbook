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
    @hawker_center_names = []
    HawkerCenter.all.each do |hawker_center|
      @hawker_center_names << hawker_center.name
    end
  end

  def create
  end
end
