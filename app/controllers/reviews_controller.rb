class ReviewsController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @review = Review.new
    @review_flavor = ReviewFlavor.new
    @flavors = Flavor.all

    flavorsarray=[]
    @dish.reviews.each do |review|
      review.review_flavors.each do |review_flavor|
        flavorsarray<<review_flavor.flavor.name
      end
    end

    flavor_count = Hash.new(0)
    flavorsarray.each {|flavor| flavor_count[flavor] += 1}
    @flavor_array = flavor_count.sort_by { |flavor, number| number}
    @last_flavor = @flavor_array[-1][0] if @flavor_array.count > 0
    @second_last_flavor=@flavor_array[-2][0] if @flavor_array.count > 1
    @third_last_flavor=@flavor_array[-3][0] if @flavor_array.count > 2

  end

  def create
    @dish = Dish.find(params[:dish_id])
    new_review_params = review_params
    new_review_params.delete("review_flavor")
    @review = Review.new(new_review_params)
    @review.user = current_user
    @review.dish = @dish
    if @review.save

      flavors =  review_params["review_flavor"]["flavor"]
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
