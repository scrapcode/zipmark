class MarksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @mark = current_user.marks.build(params[:mark])
  end

  def create
    # using https://github.com/mbleigh/acts-as-taggable-on
    # this creates 2 relationships in the :taggings model
    # because we have to add ownership to the tag to "list as tag"
    # 

    tags = params[:mark][:tag_list]
    @mark = current_user.marks.build(params[:mark])
    if @mark.save

      # This creates the correct tags, as well as the correct ownership
      # relations, however calling this afterwards creates 2 different relationships.
      # If I don't do this, the tag wont show up in @user.owned_tags
      #
      current_user.tag(@mark, :with => tags, :on => :tags)

      flash[:notice] = "Zipmark saved!"
      if params[:remote] = true
        render :close
      else
        redirect_to root_path
      end
    else
      render :action => 'new'
    end
  end

  def destroy
    @mark = current_user.marks.find(params[:id])
    @mark.destroy

    redirect_to request.referer
  end
end