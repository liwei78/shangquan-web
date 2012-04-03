# encoding: utf-8
class SearchController < ApplicationController
  
  def brand_name_search
    if params[:s].present?
      @brands = Brand.find(:all, :conditions => ["name like ?", '%'+params[:s]+'%'])
    end
    respond_to do |format|
      format.js
    end
  end
  
  def item_name_search
    if params[:s].present?
      @items = Item.find(:all, :conditions => ["title like ?", '%'+params[:s]+'%'])
    end
    respond_to do |format|
      format.js
    end
  end
end