class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def show

    @dish = Dish.find(params[:id])
    @stall = @dish.stall
    @review = Review.new
    @review_flavor = ReviewFlavor.new
    @flavors = Flavor.all

    flavorsarray=[]

    @dish.reviews.each do |review|
      review.review_flavors.each do |review_flavor|
        flavorsarray << review_flavor.flavor.name
      end
    end

    flavor_count = Hash.new(0)
    flavorsarray.each { |flavor| flavor_count[flavor] += 1}
    @flavor_array = flavor_count.sort_by { |flavor, number| number}
    @last_flavor = @flavor_array[-1][0] if @flavor_array.count > 0
    @second_last_flavor = @flavor_array[-2][0] if @flavor_array.count > 1
    @third_last_flavor = @flavor_array[-3][0] if @flavor_array.count > 2
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
