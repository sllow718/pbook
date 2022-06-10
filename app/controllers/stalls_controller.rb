class StallsController < ApplicationController
  def index
    @stalls = Stall.all
    @topstalls = @stalls.sample(4)
    @topdish = Dish.where(stall_id:@topstalls.first.id).sample
    @secondtopstalls = @topstalls[1..3]
    @topdishes = []
    @secondtopstalls.each do |stall|
      @topdishes.push(Dish.where(stall_id:stall.id).sample)
    end

    @dishes = Dish.all
  end

  def show
    @stall = Stall.find(params[:id])
    @dishes = Dish.where("stall_id=?", @stall)
  end
end
