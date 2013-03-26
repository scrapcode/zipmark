class MarksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @mark = current_user.marks.build(params[:mark])
  end

  def create
    @mark = current_user.marks.build(params[:mark])

    if @mark.save
      flash[:notice] = "Zip Mark saved!"
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