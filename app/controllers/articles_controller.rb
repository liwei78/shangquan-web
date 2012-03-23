#encoding: utf-8
class ArticlesController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  
  def index
    @user = get_current_user
    @articles = @user.articles.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  end
  
  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @current_user = get_current_user
    @comments = @article.comments.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
  end

  def edit
    @user = get_current_user
    @article = @user.articles.find(params[:id])
  end
  
  def update
    @user = get_current_user
    @article = @user.articles.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "编辑成功"
      redirect_to @article
    else
      flash[:error] = "编辑失败"
      render :action => :edit
    end
  end
  
  def destroy
    @user = get_current_user
    article = @user.articles.find(params[:id])
    article.destroy
    flash[:notice] = "删除成功"
    redirect_to articles_url
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
  
  def share
    @article = Article.find(params[:id])
    @article.increment!(:shares_count)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def collect
    @article = Article.find(params[:id])
    @article.increment!(:collections_count)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def del_photo
    @article = Article.find(params[:id])
    photo = @article.photos.find(params[:pid])
    photo.destroy
    flash[:notice] = "删除成功"
    redirect_to edit_article_url(@article)
  end
end
