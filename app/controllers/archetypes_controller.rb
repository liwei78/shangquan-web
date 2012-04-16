# encoding: utf-8
class ArchetypesController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  
  def show
    @data = Archetype.find(params[:id])
    @articles = @data.articles.paginate(:page => params[:page], :per_page => 50)
    @page_title = "#{@data.typename}：#{@data.name}"
    render :layout => "layoutfullwidth"
  end
  
  def follow
    @user = get_current_user
    @data = Archetype.find(params[:id])
    @ok = false
    unless @data.followers.include?(@user)
      @data.followers << @user
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def minifollow
    @user = get_current_user
    @data = Archetype.find(params[:id])
    @ok = false
    unless @data.followers.include?(@user)
      @data.followers << @user
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
