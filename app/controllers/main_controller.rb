# encoding: utf-8
class MainController < ApplicationController
  def index
  end

  def fashion
    @articles = Article.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "时尚"
  end

  def activity
    @activities = Activity.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "活动"
  end
  
  def company
    @companies = Company.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "商家"
  end

  def brand
    @brands = Brand.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "品牌"
  end

  def good
    @goods = Good.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "商品"
  end

end
