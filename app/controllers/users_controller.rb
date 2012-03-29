#encoding: utf-8
class UsersController < ApplicationController
  
  before_filter :need_user_login, :except => [:new, :create, :login, :checklogin, :logout, :show]
  
  def login
    render :layout => "login"
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
          cookies[:rtype]   =  {
            :value => user.rtype,
            :expires => 14.days.from_now
          }
        else
          session[:signcode]  = user.signcode
          session[:user_name] = user.name
          session[:user_id]   = user.id
          session[:rtype]   = user.rtype
        end
        format.html {redirect_to user}
      else
        flash[:error] = "登录失败"
        format.html {redirect_to welcome_users_url}
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
  
  def new
    @user = User.new
    render :layout => "login"
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        cookies[:signcode] = {
          :value => @user.signcode,
          :expires => 14.days.from_now
        }
        cookies[:user_name] = {
          :value => @user.name,
          :expires => 14.days.from_now
        }
        cookies[:user_id]   =  {
          :value => @user.id,
          :expires => 14.days.from_now
        }
        cookies[:rtype]   =  {
          :value => @user.rtype,
          :expires => 14.days.from_now
        }
        format.html { redirect_to(@user, :notice => '注册成功') }
      else
        flash[:error] = "错误"
        format.html { render :action => "new", :layout => "login" }
      end
    end
  end
  
  def edit
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

  def show
    @user = User.find(params[:id])
    @feeds = @user.feeds.with_username.paginate(:page => params[:page], :per_page => 5)
    @articles = @user.articles
    @page_title = @user.name + "的空间"
    render :layout => "layoutfullwidth"
  end
  
  def setting
    @user = get_current_user
  end
  
  def avatarsetting
    @user = get_current_user
  end
  
  def messages
    @user = get_current_user
  end
  
  def upgrade
    @user = get_current_user
  end
  
  def share
    @user = get_current_user
    if params[:aid].present?
      @activity = Activity.find(params[:aid])
    end
  end

  def updatesetting
    user = User.find(current_user_id)
    user.name = params[:name]
    if user.save
      cookies[:user_name] = {
        :value => user.name,
        :expires => 14.days.from_now
      } if cookies[:user_name].present?
      session[:user_name] = user.name if session[:user_name].present?
      flash[:notice] = '保存成功！'
    else
      flash[:error] = '保存失败！'
    end
    redirect_to :back
  end
  
  def updateavatarsetting
    user = User.find(current_user_id)
    user.avatar = params[:avatar]
    if user.save
      flash[:notice] = '头像保存成功！'
    else
      flash[:error] = '头像保存失败！'
    end
    redirect_to :back
  end
  
  def upgraderole
    user = get_current_user
    user.role = params[:role]
    user.upgrade_state = 1
    if user.save
      Message.sys_send_to(user, SITE_SETTINGS["upgrade_role_title"], "您已经申请成为 #{SITE_SETTINGS["site_role"][user.role]}，请等待审核通知。")
      if params[:brand_name].present? and [2,3,4].include?(params[:role].to_i)
        brands = []
        for name in params[:brand_name]
          brands << Brand.create(:name => name, :tmp => true) unless name.blank?
        end
        user.brands = brands
      end
      flash[:notice] = '申请结果请等待系统通知。'
    else
      flash[:error] = '申请失败。'
    end
    redirect_to upgrade_users_url
  end
  
  def postpublish
    article = Article.new(
      :title    => params[:title], 
      :content  => params[:content], 
      :tag_list => params[:tag_list],
      :poster   => params[:poster],
      :user_id  => current_user_id,
      :state    => current_user_rtype)

      # video code
      if params[:relate_0] == "0"
        article.is_article = true
      end

      # video code
      if params[:relate_2] == "2"
        article.code = params[:code]
        article.is_video = true
      end

      # activity and company
      if params[:relate_3] == "3"
        article.schedule    = params[:schedule]
        article.address     = params[:address]
        article.category    = params[:category]
        article.area        = params[:area]
        article.is_activity = true
        article.is_company  = true
      end
      
      # brand
      if params[:relate_4] == "4"
        article.brand_name = params[:brand_name]
        article.brand_desc = params[:brand_desc]
        article.is_brand = true
      end
      
      # item
      if params[:relate_5] == "5"
        article.price = params[:price]
        article.is_item = true
      end

      # groupbuy
      if params[:relate_6] == "6"
        article.groupbuy_desc = params[:groupbuy_desc]
        article.is_groupbuy = true
      end

      if article.save
        # photos
        if params[:relate_1] == "1"
          files = params[:photos].present? ? params[:photos][:file] : []
          files.each do |file|
            Photo.create(:file => file, :klass_type => "Article", :klass_id => article.id) if file.present?
          end
          article.update_attribute(:is_photo, true)
        end
        User.update_counters current_user_id, :articles_count => 1
        flash[:notice] = "发布成功"
      else
        p article.errors
        flash[:error] = "发布失败"
      end

    redirect_to articles_user_url(current_user_id)
  end
  
  def postshare
    article = Article.new(
      :title    => params[:title], 
      :content  => params[:content], 
      :tag_list => params[:tag_list],
      :poster   => params[:poster],
      :user_id  => current_user_id,
      :state    => current_user_rtype)
      
    if params[:add_video] == "true"
      article.video_code = params[:code]
      article.is_video = true
    end
    
    if article.save
      # items
      if params[:add_items] == "true"
        items = Item.find(params[:items])
        article.items = items
        article.is_item = true
        if params[:activity_id].present?
          activity = Activity.find(params[:activity_id])
          activity.items = items
          activity.articles << article
        end
      end
      
      # photos
      if params[:add_album] == "true"
        files = params[:photos].present? ? params[:photos][:file] : []
        unless files.blank?
          files.each do |file|
            Photo.create(:file => file, :klass_type => "Article", :klass_id => article.id) if file.present?
          end
          article.update_attribute(:is_photo, true)
        end
      end
      User.update_counters current_user_id, :articles_count => 1
      
      flash[:notice] = "发布成功"
    else
      flash[:error] = "发布失败"
    end
    redirect_to user_url(current_user_id)
    
  end
  
  def follow
    @user = User.find(params[:id])
    @ok = false
    @msg = ""
    if @user == @current_user
      @msg = "亲，自己不能关注自己。"
    else
      if @current_user.following?(@user)
        @msg = "亲，你已经关注过了"
      else
        @current_user.follow!(@user)
        @ok = true
        Message.sys_send_to(@user.id, "#{@current_user.name}关注了你", "<a href='/users/#{@current_user.id}' target='_blank'>#{@current_user.name}</a> 刚刚关注了你，现在去看看吧。")
      end
    end
    respond_to do |format|
      format.js
    end
  end
  
  def minifollow
    @user = User.find(params[:id])
    @ok = false
    @msg = ""
    if @user == @current_user
      @msg = "亲，自己不能关注自己。"
    else
      if @current_user.following?(@user)
        @msg = "亲，你已经关注过了"
      else
        @current_user.follow!(@user)
        @ok = true
        Message.sys_send_to(@user.id, "#{@current_user.name}关注了你", "<a href='/users/#{@current_user.id}' target='_blank'>#{@current_user.name}</a> 刚刚关注了你，现在去看看吧。")
      end
    end
    respond_to do |format|
      format.js
    end
  end
  
  def unfollow
    @user = User.find(params[:id])
    @current_user = get_current_user
    @ok = false
    @msg = ""
    if @user == @current_user
      @msg = "亲，自己不能操作自己。"
    else
      if !@current_user.following?(@user)
        @msg = "亲，你已经取消关注过了"
      else
        @current_user.unfollow!(@user)
        @ok = true
      end
    end
    respond_to do |format|
      format.js
    end
  end
  
end
