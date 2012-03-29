# encoding: utf-8
class MainController < ApplicationController
  def index
    @articles = Article.white.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @todaystar = User.todaystar.first
    @top_items = Item.find(:all, :conditions => ["top = ?", true], :limit => 6, :order => "position asc", :include => :user)
    @top_activity = Activity.find(:first, :conditions => ["top = ?", true])
    @top_activity_items = @top_activity.items.is_suggest if @top_activity
    @suggest_activities = Activity.is_suggest.limit(3)
  end

  def articles
    @articles = Article.white.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @page_title = "时尚"
    render :layout => "layoutfullwidth"
  end
  
  def activities
    @activities = Activity.all
    @page_title = "活动"
  end
  
  def items
    @items = Item.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @page_title = "商品"
    render :layout => "layoutfullwidth"
  end
  
  def companies
    @articles = Article.is_company.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @page_title = "商家"
    render :layout => "layoutfullwidth"
  end
  
  # def brand
  #   if params[:tag].present?
  #     @brands = Article.white.type_3.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  #   else
  #     @brands = Article.white.type_3.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  #   end
  #   @page_title = "品牌"
  # end
  # 
  # def item
  #   @items = Item.white.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  #   @page_title = "商品"
  # end

end
