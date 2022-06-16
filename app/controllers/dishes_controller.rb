class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @stall = @dish.stall
    @review = Review.new
    flavorsarray=[]
    @dish.reviews.each do |review|
      review.review_flavors.each do |review_flavor|
        flavorsarray<<review_flavor.flavor.name
      end
    end
    flavor_count = Hash.new(0)
    flavorsarray.each {|flavor| flavor_count[flavor] += 1}
    @last_flavor = flavor_count.sort_by { |flavor,number| number}
    raise
flavor_count.delete(@last_flavor)
             @second_last_flavor=flavor_count.sort_by { |flavor,number| number}.last[0]

  end

  def new
    @user = current_user
    @dish = Dish.new
    @stalls = Stall.all
    @dish.stall_id = @user.stalls.last.id
    @stall = @user.stalls.last
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
