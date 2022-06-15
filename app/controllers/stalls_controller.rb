class StallsController < ApplicationController
  def index
    @stalls = Stall.all
    @topstalls = @stalls[6..9]
    @topdish = Dish.where(stall_id:@topstalls.first.id).first
    @secondtopstalls = @topstalls[1..3]
    @topdishes = []
    @secondtopstalls.each do |stall|
      @topdishes.push(Dish.where(stall_id:stall.id).first)
    end

    if params[:query].present?
      @dishes = Dish.global_search(params[:query])
    else
      @dishes = Dish.all
    end


  end

  def destroy
    @stall = Stall.find(params[:id])
    @stall.destroy
    redirect_to root_path
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
      redirect_to new_dish_path(@stall)
    else
      render 'new'
    end
  end

  private

  def stall_params
    params.require(:stall).permit(:name, :unit, :hawker_center_id, :description, :photo)
  end
end
