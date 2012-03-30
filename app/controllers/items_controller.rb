# encoding: utf-8
class ItemsController < ApplicationController
  before_filter :need_user_login
  
  def index
    @user = get_current_user
    @items = @user.items.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  end
  
  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
    @user = @item.user
  end
  
  def new
    @user = get_current_user
    @item = Item.new
  end
  
  def edit
    @user = get_current_user
    @item = @user.items.find(params[:id])
  end
  
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user_id
    if params[:brand] == "my"
      @item.brand_id = params[:my_brand_id]
    end
    if params[:brand] == "sys"
      @item.brand_id = params[:sys_brand_id]
    end
    if @item.save
      flash[:notice] = "添加成功"
      redirect_to @item
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end
  
  def update
    @user = get_current_user
    @item = @user.items.find(params[:id])
    if params[:brand] == "my"
      @item.brand_id = params[:my_brand_id]
    end
    if params[:brand] == "sys"
      @item.brand_id = params[:sys_brand_id]
    end
    if @item.update_attributes(params[:item])
      flash[:notice] = "编辑成功"
      redirect_to @item
    else
      flash[:error] = "编辑失败"
      render :action => :edit
    end
  end
  
  def destroy
    @user = get_current_user
    item = @user.items.find(params[:id])
    item.destroy
    flash[:notice] = "删除成功"
    redirect_to items_url
  end
  
  def write
    item = Item.find(params[:id])
    comment = item.comments.new(:content => params[:content], :user_id => current_user_id)
    if comment.save
      item.increment!(:comments_count)
      flash[:notice] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    redirect_to :back
  end
  
  def like
    @item = Item.find(params[:id])
    user = get_current_user
    unless user.like_items.include?(@item)
      @item.increment!(:likes_count)
      user.like_items << @item
      @plus_one = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def minilike
    @item = Item.find(params[:id])
    user = get_current_user
    @ok = false
    unless user.like_items.include?(@item)
      @item.increment!(:likes_count)
      user.like_items << @item
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def search
    if params[:uid].present?
      @items       = Item.paginate(:conditions => ["unique_id like ?", "%"+params[:uid]+"%"], :include => :brand, :page => params[:page], :per_page => 6)
      @items_count = Item.where("unique_id like ?", "%"+params[:uid]+"%").count
      @page_total  = @items_count > 6 ? (@items_count%6==0 ? @items_count/6 : @items_count/6+1) : 1
      @page        = params[:page].to_i
      @pre_page    = @page>1 ? @page-1 : 1
      @next_page   = @page+1
      @blank       = false
    else
      @blank = true
    end
    respond_to do |format|
      format.js
    end
  end
  
  def my
    @user = get_current_user
    @items = @user.items.white
  end
  
  def store
    @items = Item.in_store.white.all
  end
  
  

end
