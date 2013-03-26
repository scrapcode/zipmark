class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @marks = current_user.marks.order("created_at DESC")
  end
end
