#encoding: utf-8
class UsersController < ApplicationController
  
  before_filter :need_user_login, :except => [:new, :create, :login, :checklogin, :logout, :show]
  
  def login
    render :layout => "application"
  end
  
  def checklogin
    user = User.authenticate(params[:email], params[:password])
    respond_to do |format|
      if user
        if params[:remember_me] == "true"
          cookies[:signcode] = {
            :value => user.signcode,
            :expires => 14.days.from_now
          }
          cookies[:user_name] = {
            :value => user.name,
            :expires => 14.days.from_now
          }
          cookies[:user_id]   =  {
            :value => user.id,
            :expires => 14.days.from_now
          }
        else
          session[:signcode]  = user.signcode
          session[:user_name] = user.name
          session[:user_id]   = user.id
        end
        format.html {redirect_to user}
      else
        flash[:error] = "登录失败"
        format.html {redirect_to :back}
      end
    end
  end
  
  def logout
    session.delete(:signcode)
    session.delete(:user_name)
    session.delete(:user_id)
    cookies.delete(:signcode)
    cookies.delete(:user_name)
    cookies.delete(:user_id)
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end

  def show
    @user = User.find(params[:id])
    @feeds = @user.feeds.with_username.paginate(:page => params[:page], :per_page => 5)
    @nav_all = "on"
    @page_title = @user.name + "的空间"
  end
  
  def articles
    @user = User.find(params[:id])
    @articles = @user.articles.type_0.paginate(:page => params[:page], :per_page => 5)
    @nav_articles = "on"
  end

  def photos
    @user = User.find(params[:id])
    @articles = @user.articles.type_1.paginate(:page => params[:page], :per_page => 5)
    @nav_photos = "on"
  end

  def videos
    @user = User.find(params[:id])
    @articles = @user.articles.type_2.paginate(:page => params[:page], :per_page => 5)
    @nav_videos = "on"
  end

  def goods
    @user = User.find(params[:id])
    @goods = @user.goods.paginate(:page => params[:page], :per_page => 5)
    @nav_goods = "on"
  end
  
  def setting
    @nav_setting = 'on'
    @user = get_current_user
  end
  
  def write
    @user = get_current_user
  end
  
  def upload
    @user = get_current_user
  end
  
  def pubvideo
    @user = get_current_user
  end
  
  def pubgood
    @user = get_current_user
  end
  
  def new
    @user = User.new
    render :layout => "application"
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        cookies[:signcode] = {
           :value => @user.signcode,
           :expires => 14.days.from_now
         }
         cookies[:user_name] = @user.name
         cookies[:user_id] = @user.id
        format.html { redirect_to(@user, :notice => '注册成功') }
      else
        flash[:error] = "错误"
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html { redirect_to :back, :notice => "更新成功" }
      else
        flash[:error] = "错误"
        format.html { redirect_to :back }
      end
    end
  end
  
  def postcontent
    article = Article.new(:title => params[:title], :content => params[:content], :article_type => 'article')
    article.user_id = current_user_id
    article.save
    redirect_to articles_user_url(current_user_id)
  end
  
  def uploadphoto
    article = Article.new(:title => params[:title], :content => params[:content], :article_type => 'photo')
    article.user_id = current_user_id
    article.save
    files = params[:photos].present? ? params[:photos][:file] : []
    files.each do |file|
      Photo.create(:file => file, :klass_type => "Article", :klass_id => article.id) if file.present?
    end
    redirect_to photos_user_url(current_user_id)
  end
  
  def postvideo
    article = Article.new(:title => params[:title], :content => params[:content], :code => params[:code], :article_type => 'video')
    article.user_id = current_user_id
    article.save
    redirect_to videos_user_url(current_user_id)
  end

  def postgood
    good = Good.new(:title => params[:title], :price => params[:price], :content => params[:content], :poster => params[:poster])
    good.user_id = current_user_id
    good.save
    files = params[:photos].present? ? params[:photos][:file] : []
    files.each do |file|
      Photo.create(:file => file, :klass_type => "Good", :klass_id => good.id) if file.present?
    end
    redirect_to goods_user_url(current_user_id)
  end

  def updatesetting
    user = User.find(current_user_id)
    user.avatar = params[:avatar]
    if user.save
      flash[:notice] = '头像保存成功！'
    else
      flash[:error] = '头像保存失败！'
    end
    redirect_to :back
  end
  
end
