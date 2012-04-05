# encoding: utf-8
class SearchController < ApplicationController
  
  def item_name_search
    if params[:s].present?
      @items = Item.find(:all, :conditions => ["title like ?", '%'+params[:s]+'%'])
    end
    respond_to do |format|
      format.json { render :json => @items.to_json}
    end
  end

  def brand_name_search
    if params[:s].present?
      @brands = Brand.find(:all, :conditions => ["name like ?", '%'+params[:s]+'%'])
    end
    respond_to do |format|
      format.js
      format.json { render :json => @brands.to_json}
    end
  end
  
end