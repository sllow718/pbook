class DashboardsController < ApplicationController
  def dashboard
    @dashboard_stall = Stall.find_by(user_id: current_user.id)
    @dishes = @dashboard_stall.dishes
  end
end
