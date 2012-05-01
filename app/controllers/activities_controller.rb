# encoding: utf-8
class ActivitiesController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  
  def index
    @user = get_current_user
    @activities = @user.activities.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  end
  
  def show
    @activity = Activity.find(params[:id])
    @articles = @activity.articles.paginate(:page => params[:page], :per_page => 50)
  end
  
  def edit
    @user = get_current_user
    @activity = @user.activities.find(params[:id])
  end
  
  def update
    @user = get_current_user
    @activity = @user.activities.find(params[:id])
    if @activity.update_attributes(params[:activity])
      flash[:notice] = "编辑成功"
      redirect_to @activity
    else
      flash[:notice] = "编辑失败"
      render :action => :edit
    end
  end
end