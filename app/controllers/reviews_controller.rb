class ReviewsController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.dish = @dish

  if @review.save
      redirect_to @dish
    else
      render @review
    end
  end




  private

  def review_params
    params.require(:review).permit(:comment, :photo, :rating)
  end
end
