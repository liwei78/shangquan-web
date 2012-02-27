#encoding: utf-8
class BrandsController < ApplicationController
  before_filter :need_user_login, :except => [:show, :view]
  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.type_3.find(params[:id])
    @nav_brands = 'on'
    render :layout => "users"
  end

  def view
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(:page => params[:page], :per_page => 10)
    @nav_brands = 'on'
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