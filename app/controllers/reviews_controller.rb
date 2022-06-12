class ReviewsController < ApplicationController
   def create
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    @review.dish = @dish
    if @dish.save
      redirect_to dish_path(@dish, anchor: "review-#{@review.id}")
    else
      render 'dishes/show'
    end
  end

  def new
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
  end


  private

  def review_params
    params.require(:review).permit(:comment, :photo)
  end
end
