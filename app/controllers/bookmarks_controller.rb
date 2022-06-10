class BookmarksController < ApplicationController
  def bookmark
    dish = Dish.find(params[:dish_id])
    user = current_user
    new_bookmark = Bookmark.new
    new_bookmark.dish_id = dish.id
    new_bookmark.user_id = user.id
    if new_bookmark.save
      redirect_to stall_path(dish.stall.id)
    end
  end

  def unbookmark
  end
end
