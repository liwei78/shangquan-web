class ItemsController < ApplicationController
  before_filter :need_user_login
  def index
    
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
    if @item.save
      redirect_to my_items_url
    else
      render :action => :new
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def my
    @user = get_current_user
    @items = @user.items.white
  end
  
  def store
    @items = Item.in_store.white.all
  end

end
