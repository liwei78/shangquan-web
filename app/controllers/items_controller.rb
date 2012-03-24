# encoding: utf-8
class ItemsController < ApplicationController
  before_filter :need_user_login
  
  def index
    @user = get_current_user
    @items = @user.items.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  end
  
  def show
    @user = get_current_user
    @item = @user.items.find(params[:id])
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
  
  def my
    @user = get_current_user
    @items = @user.items.white
  end
  
  def store
    @items = Item.in_store.white.all
  end
  
  

end
