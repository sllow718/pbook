class ReviewsController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
    @review_flavor = ReviewFlavor.new
    @flavors = Flavor.all
  end

  def create
    @dish = Dish.find(params[:dish_id])
    new_review_params = review_params
    new_review_params.delete("review_flavor")
    @review = Review.new(new_review_params)

    @review.user = current_user
    @review.dish = @dish
    if @review.save
      new_review_flavor_params =  review_params["review_flavor"]
      new_review_flavor_params["review_id"] = @review.id
      @review_flavor = ReviewFlavor.new(new_review_flavor_params)
      if @review_flavor.save
        redirect_to @dish
      else
        render @review
      end
    else
      render @review
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :photo, :rating, :review_flavor => [:flavor_id])
  end
end
