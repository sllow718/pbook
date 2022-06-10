class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
  end

  def new
    @dish = Dish.new
    @user = current_user
  end

  def create
    @user = current_user
    @dish = Dish.new(dish_params)

    if @item.save
      redirect_ to @user, notice: "Dish has successfully been saved."
    else
      render 'dishes/new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def dish_params
      params.require(:dish).permit(:name, :price, :description, :dish_type, :stall_id)
    end
end
