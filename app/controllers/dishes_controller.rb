class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @stall = @dish.stall
    @review = Review.new
  end

  def new
    @user = current_user
    @dish = Dish.new
    @stalls = Stall.all
    @dish.stall_id = @user.stalls.last.id
    @stall = @user.stalls.last
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    @stall = @dish.stall
    redirect_to stall_path(@stall)
  end


  def create
    @user = current_user
    @dish = Dish.new(dish_params)
    @dish.stall_id = @user.stalls.last.id
    @stall = @user.stalls.last

    if @dish.save
      flash[:success] = "Dish created successfully."
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Dish not created successfully."
      redirect_back(fallback_location: root_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def dish_params
      params.require(:dish).permit(:name, :price, :description, :dish_type, :stall_id, :photo, :flavor)
    end
end
