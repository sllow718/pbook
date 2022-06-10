class BookmarksController < ApplicationController
  def bookmark
    dish = Dish.find(params[:dish_id])
    user = current_user
    bookmark = Bookmark.where(user_id: user.id, dish_id: dish.id).first
    if bookmark.present?
      Bookmark.destroy(bookmark.id)
    else
      new_bookmark = Bookmark.new
      new_bookmark.dish_id = dish.id
      new_bookmark.user_id = user.id
      new_bookmark.save!
    end
    redirect_to stall_path(dish.stall.id)
  end

    # new_bookmark = Bookmark.new
    # new_bookmark.dish_id = dish.id
    # new_bookmark.user_id = user.id
    # if new_bookmark.save
    # end

  # def destroy
  #   dish = Dish.find(params[:dish_id])
  #   user = current_user
  #   @bookmark = Bookmark.where(user_id: user.id, dish_id: dish.id)
  #   @bookmark.destroy
  #   redirect_to stall_path(dish.stall.id)
  # end
end
