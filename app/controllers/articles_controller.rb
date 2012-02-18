#encoding: utf-8
class ArticlesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @nav_articles = 'on' if @article.article_type == 0
    @nav_photos   = 'on' if @article.article_type == 1
    @nav_videos   = 'on' if @article.article_type == 2
    render :layout => "users"
  end  


end
