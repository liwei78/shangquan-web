# encoding: utf-8
class SearchController < ApplicationController

  before_filter :need_user_login
  
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
      user = get_current_user
      if user.brands.present?
        @brands = user.brands
      else
        @brands = Archetype.find(:all, :conditions => ["archetypes.category_id = 1 and archetypes.name like ?", '%'+params[:s]+'%'])
      end
    end
    respond_to do |format|
      format.json { render :json => @brands.to_json}
    end
  end

  def uniqueid_search
    if params[:uid].present?
      @items = Item.find(:all, :conditions => ["unique_id like ?", '%'+params[:uid]+'%'])
    end
    respond_to do |format|
      format.json { render :json => @items.to_json}
    end
  end
  
  
end
