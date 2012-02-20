#encoding: utf-8
class ArticlesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @nav_articles = 'on' if @article.article_type == 'article'
    @nav_photos   = 'on' if @article.article_type == 'photo'
    @nav_videos   = 'on' if @article.article_type == 'video'
    render :layout => "users"
  end  


end
