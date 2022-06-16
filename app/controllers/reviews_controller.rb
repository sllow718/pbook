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

      flavors =  review_params["review_flavor"]["flavor_id"]
      flavors[1..].each do |flavor|
        new_review_flavor=ReviewFlavor.new(review: @review, flavor_id: flavor)
        new_review_flavor.save!
      end
      redirect_to @dish
    else
        render "reviews/new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :photo, :rating, :review_flavor=> {} )
  end
end
