# encoding: utf-8
class MainController < ApplicationController
  def index
  end

  def fashion
    @articles = Article.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "时尚"
  end

  def activity
    if params[:tag].present?
      @activities = Activity.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:category].present?
      @activities = Activity.where(["activity_category = ?", URI.decode(params[:category])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:area].present?
      @activities = Activity.where(["activity_area = ?", URI.decode(params[:area])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    else
      @activities = Activity.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    end
    @page_title = "活动"
  end
  
  def company
    if params[:tag].present?
      @companies = Company.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:category].present?
      @companies = Company.where(["company_category = ?", URI.decode(params[:category])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:area].present?
      @companies = Company.where(["company_area = ?", URI.decode(params[:area])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    else
      @companies = Company.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    end
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
