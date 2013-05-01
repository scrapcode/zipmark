class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @marks = current_user.marks.order("created_at DESC")
  end

  def show_user_tags
    @tag = params[:tag]
    @marks = current_user.marks.tagged_with(@tag, :owned_by => current_user)
    render 'index'
  end

  def show_all_tags
    @tag = params[:tag]
    tag_id = Tag.find_by_name(@tag)
    @marks = Mark.find(:all,
                :joins => [:taggings],
                :conditions => ['taggings.tagger_id IS NOT NULL AND taggings.tag_id = ?', tag_id])
    render 'index'
  end

  def add_mark
    @url = params[:url]
    @title = params[:title]
  end
end
