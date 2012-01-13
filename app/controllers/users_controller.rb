#encoding: utf-8
class UsersController < ApplicationController
  
  before_filter :required_login, :except => [:new, :create, :login, :checklogin, :logout, :show]
  
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
        flash[:error] = "失败"
        format.html {redirect_to :back}
      end
    end
  end
  
  def logout
    session.delete(:signcode)
    session.delete(:user_name)
    session.delete(:user_id)
    cookies.delete(:signcode)
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end

  def show
    @user = User.find(params[:id])
    @feeds = @user.feeds.paginate(:page => params[:page], :per_page => 5)
  end
  
  def articles
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(:page => params[:page], :per_page => 5)
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
  
  def write
    
  end
  
  def postcontent
    article = Article.new(:title => params[:title], :content => params[:content])
    article.user_id = current_user_id
    article.save
    redirect_to articles_user_id(current_user_id)
  end
  
  private
  
  def required_login
    unless loggin?
      flash[:notice] = "请登录"
      redirect_to welcome_users_url
    end 
  end

end
