class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @marks = current_user.marks.order("created_at DESC")
  end

  def sort_by_tag
    @tag = params[:tag]
    @marks = current_user.marks.tagged_with(@tag, :owned_by => current_user)
    render 'index'
  end
end
