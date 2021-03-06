# encoding: utf-8
class BrandsController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  
  def index
    @user = get_current_user
    @brands = @user.brands
  end

  def show
    @brand = Brand.find(params[:id])
    @articles = @brand.articles.paginate(:page => params[:page], :per_page => 50)
    @page_title = "品牌：#{@brand.name}"
    render :layout => "layoutfullwidth"
  end

  def edit
    @user = get_current_user
    @brand = @user.brands.find(params[:id])
  end
  
  def new
    @user = get_current_user
    @brand = Brand.new
  end
  
  def create
    @user = get_current_user
    @brand = Brand.new(params[:brand])
    if @brand.save
      @user.brands << @brand
      flash[:notice] = "添加成功"
      redirect_to brands_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end
  
  def update
    @user = get_current_user
    @brand = @user.brands.find(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:notice] = "编辑成功"
      redirect_to brands_url
    else
      flash[:error] = "编辑失败"
      render :action => :edit
    end
  end
  
  def destroy
    @user = get_current_user
    brand = @user.brands.find(params[:id])
    brand.destroy
    flash[:notice] = "删除成功"
    redirect_to brands_url
  end
  
  def follow
    @user = get_current_user
    @brand = Brand.find(params[:id])
    @ok = false
    unless @brand.followers.include?(@user)
      @brand.followers << @user
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def minifollow
    @user = get_current_user
    @brand = Brand.find(params[:id])
    @ok = false
    unless @brand.followers.include?(@user)
      @brand.followers << @user
      @ok = true
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
