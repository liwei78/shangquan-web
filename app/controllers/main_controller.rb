# encoding: utf-8
class MainController < ApplicationController
  def index
    @articles = Article.white.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @todaystar = User.todaystar.first
    @top_items = ArticleItem.find(:all, :conditions => ["top = ?", true], :limit => 6, :order => "position asc", :include => :user)
    @top_activity = Activity.find(:first, :conditions => ["top = ?", true])
    @top_activity_items = @top_activity.items.is_suggest if @top_activity
    @suggest_activities = Activity.is_suggest.limit(3)
  end

  def articles
    @articles = Article.allow_published.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @page_title = "时尚"
    render :layout => "layoutfullwidth"
  end
  
  def activities
    @activities = Activity.opening
    @page_title = "活动"
  end
  
  def items
    @items = Item.paginate(:page => params[:page], :per_page => 100, :order => "id desc")||[]
    @page_title = "商品"
    render :layout => "layoutfullwidth"
  end
  
  def companies
    @areas = Area.order("position asc")
    @page_title = "商家"
  end

  def malls
    @areas = Area.order("position asc")
    @page_title = "商场"
  end
  
  def brands
    @channels = Channel.order('position asc')
    @page_title = "品牌"
  end

  def repasts
    @areas = Area.order("position asc")
    @page_title = "餐饮"
  end

  def b2b
    @areas = Area.order("position asc")
    @page_title = "电商"
  end

end
