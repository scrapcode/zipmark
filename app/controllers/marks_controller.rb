class MarksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @mark = current_user.marks.build(params[:mark])
  end

  def create
    @mark = current_user.marks.build(params[:mark])
    tags = params[:mark][:tag_list]
    if @mark.save

      current_user.tag(@mark, :with => tags, :on => :tags)

      flash[:notice] = "Zip Mark saved!\n" + tags.to_s
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @mark = current_user.marks.find(params[:id])
    @mark.destroy

    redirect_to root_path
  end
end