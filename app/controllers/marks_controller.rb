class MarksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @mark = current_user.marks.build(params[:mark])
  end

  def create
    # using https://github.com/mbleigh/acts-as-taggable-on
    #
    # this successfully creates the tags in :tags
    # however, it doesn't add the ownership relationship to current_user
    
    @mark = current_user.marks.build(params[:mark])
    tags = params[:mark][:tag_list]
    if @mark.save

      # This creates the correct tags, as well as the correct ownership
      # relations, however calling this afterwards creates 2 different relationships.
      # If I don't do this, the tag wont show up in @user.owned_tags
      #
      # current_user.tag(@mark, :with => tags, :on => :tags)

      flash[:notice] = "Zip Mark saved!\n" + tags.to_s
      redirect_to root_path
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