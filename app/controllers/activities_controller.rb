#encoding: utf-8
class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @comments = @activity.comments.paginate(:page => params[:page], :per_page => 10)
  end
  
  def visited
    activity = Activity.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def favorite
    activity = Activity.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def share
    activity = Activity.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def write
    activity = Activity.find(params[:id])
    comment = activity.comments.new(:content => params[:content], :user_id => current_user_id)
    if comment.save
      activity.increment!(:comments_count)
      flash[:notice] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    redirect_to :back
  end
end