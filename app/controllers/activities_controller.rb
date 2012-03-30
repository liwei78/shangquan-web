# encoding: utf-8
class ActivitiesController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  def show
    @activity = Activity.find(params[:id])
    @articles = @activity.articles.paginate(:page => params[:page], :per_page => 50)
  end
end