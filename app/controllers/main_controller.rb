# encoding: utf-8
class MainController < ApplicationController
  def index
  end

  def article
    if params[:tag].present?
      @articles = Article.white.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
      @page_title = "#{URI.decode(params[:tag])} - 时尚"
    else
      @articles = Article.white.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
      @page_title = "时尚"
    end
  end

  def activity
    if params[:tag].present?
      @activities = Activity.white.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:category].present?
      @activities = Activity.white.where(["activity_category = ?", URI.decode(params[:category])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:area].present?
      @activities = Activity.white.where(["activity_area = ?", URI.decode(params[:area])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    else
      @activities = Activity.white.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    end
    @page_title = "活动"
  end
  
  def company
    if params[:tag].present?
      @companies = Company.white.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:category].present?
      @companies = Company.white.where(["company_category = ?", URI.decode(params[:category])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    elsif params[:area].present?
      @companies = Company.white.where(["company_area = ?", URI.decode(params[:area])]).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    else
      @companies = Company.white.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    end
    @page_title = "商家"
  end

  def brand
    if params[:tag].present?
      @brands = Article.white.type_3.tagged_with(URI.decode(params[:tag])).paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    else
      @brands = Article.white.type_3.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    end
    @page_title = "品牌"
  end

  def good
    @goods = Good.white.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @page_title = "商品"
  end

end
