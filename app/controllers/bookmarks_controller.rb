class BookmarksController < ApplicationController
  def bookmark
    dish = Dish.find(params[:dish_id])
    user = current_user
    bookmark = Bookmark.where(user_id: user.id, dish_id: dish.id).first if user.id rescue false
    if bookmark.present?
      Bookmark.destroy(bookmark.id)
      # redirect_to stall_path(dish.stall.id)
      redirect_back(fallback_location: stall_path(dish.stall.id))
    elsif (user.id rescue false)
      new_bookmark = Bookmark.new
      new_bookmark.dish_id = dish.id
      new_bookmark.user_id = user.id
      new_bookmark.save!
      # redirect_to stall_path(dish.stall.id)
      redirect_back(fallback_location: stall_path(dish.stall.id))
    else
      # redirect_to stall_path(dish.stall.id), alert: "You must be logged in to bookmark"
      redirect_back(fallback_location: stall_path(dish.stall.id), alert: "You must be logged in to bookmark")

    end
  end
end
