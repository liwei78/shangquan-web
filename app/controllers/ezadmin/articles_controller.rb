#encoding: utf-8
class Ezadmin::ArticlesController < ApplicationController
  before_filter :set_admin_nav_flag
  layout "admin"
  
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 20, :order => "id desc")
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        flash[:notice] = '添加成功'
        format.html { redirect_to(ezadmin_articles_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = '编辑成功'
        format.html { redirect_to(ezadmin_articles_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      flash[:notice] = '删除成功'
      format.html { redirect_to(ezadmin_articles_url) }
    end
  end
  
  
  
  private
  
  def set_admin_nav_flag
    @admin_nav_flag = "articles"
  end
end