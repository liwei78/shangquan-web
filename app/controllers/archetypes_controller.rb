# encoding: utf-8
class ArchetypesController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  
  def show
    @archetype = Archetype.find(params[:id])
    @user = get_current_user
    @articles = @archetype.articles.paginate(:page => params[:page], :per_page => 50)
    @page_title = "#{@archetype.category.present? ? @archetype.category.name + " : " : ""}#{@archetype.name}"
    render :layout => "layoutfullwidth"
  end
  
  def follow
    @user = get_current_user
    @archetype = Archetype.find(params[:id])
    @ok = false
    unless @archetype.followers.include?(@user)
      @archetype.followers << @user
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def minifollow
    @user = get_current_user
    @archetype = Archetype.find(params[:id])
    @ok = false
    unless @archetype.followers.include?(@user)
      @archetype.followers << @user
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
