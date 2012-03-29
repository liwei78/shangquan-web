# encoding: utf-8
class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @articles = @activity.articles.paginate(:page => params[:page], :per_page => 50)
  end
end