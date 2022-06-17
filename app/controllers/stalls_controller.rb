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
    @flavors = Flavor.all

    if params[:query].present?
      @dishes = Dish.global_search(params[:query])
    else
      @dishes = Dish.all[1..12]
    end
  end

  def mystallsindex
    @stalls = current_user.stalls
  end


  def destroy
    @stall = Stall.find(params[:id])
    @stall.destroy
    redirect_to root_path
  end

  def show
    @stall = Stall.find(params[:id]) rescue nil
    if @stall.nil?
      redirect_to root_path, alert: "Stall not found"
    else
      @dishes = Dish.where("stall_id=?", @stall)
      @stallmap = {
        lat: @stall.hawker_center.latitude,
        lng: @stall.hawker_center.longitude,
        info_window: render_to_string(partial: "info_window", locals: { hawker: @stall.hawker_center })
      }
    end
  end

  def new
    @stall = Stall.new
    @hawkers = HawkerCenter.all
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
