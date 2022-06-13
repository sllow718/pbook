class ReviewsController < ApplicationController
   def create
    @dish = Dish.find(params[:dish_id])
    @review = Review.new(review_params)
    @review.dish = @dish

    respond_to do |format|
      if  @dish.save
        format.html { redirect_to dish_path(@dish, anchor: "review-#{@review.id}") }
        format.json
      else
        format.html { render 'dishes/show', status: :unprocessable_entity }
        format.json
      end
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
