#encoding: utf-8
class ArticlesController < ApplicationController
  before_filter :need_user_login, :except => [:show, :view]
  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @nav_articles = 'on' if @article.article_type == 'article'
    @nav_photos   = 'on' if @article.article_type == 'photo'
    @nav_videos   = 'on' if @article.article_type == 'video'
    render :layout => "users"
  end

  def view
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(:page => params[:page], :per_page => 10)
    @nav_articles = 'on'
  end
  
  def write
    article = Article.find(params[:id])
    comment = article.comments.new(:content => params[:content], :user_id => current_user_id)
    if comment.save
      article.increment!(:comments_count)
      flash[:notice] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    redirect_to :back
  end
  
  def like
    @article = Article.find(params[:id])
    @article.increment!(:likes_count)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
