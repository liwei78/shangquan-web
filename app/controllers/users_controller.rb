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
          session[:rtype]     = user.rtype
        end
        user.win("login")
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
        @user.win("create")
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
    # @current_user = get_current_user
    # respond_to do |format|
    #   if @current_user.update_attributes(params[:user])
    #     p @current_user.errors
    #     format.html { redirect_to :back, :notice => "更新成功" }
    #   else
    #     flash[:error] = "错误"
    #     format.html { redirect_to :back }
    #   end
    # end
  end

  def show
    @user = User.find(params[:id])
    @current_user = get_current_user
    # @feeds = @user.feeds.paginate(:include => :user, :page => params[:page], :per_page => 5)
    @articles = @user.articles.paginate(:page => params[:page], :per_page => 20)
    case @user.role
    when 0
      @page_title = @user.name + "的空间"
    when 1
      @page_title = "设计师: " + @user.name + "的空间"
    when 2
      @page_title = "商家: " + @user.name + "的空间"
    when 3
      @page_title = "商场: " + @user.name + "的空间"
    when 4
      @page_title = "品牌专卖店: " + @user.name + "的空间"
    else
      @page_title = @user.name + "的空间"
    end
    
    if [2,3,4].include?(@user.role)
      render :template => "users/comusershow"
    else
      render :layout => "layoutfullwidth", :template => "users/show"
    end
  end
  
  def setting
    @user = get_current_user
  end
  
  def avatarsetting
    @user = get_current_user
  end
  
  def setpwd
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
      @archetype = Archetype.find(params[:aid])
    end
    if params[:acid].present?
      @activity = Activity.find(params[:acid])
    end
  end

  def discover
    @user = get_current_user
  end

  def apply
    @user = get_current_user
    @archetype = Archetype.find(params[:aid])
  end

  def find
    @user = get_current_user
    @report = Report.new
    if params[:aid].present?
     @archetype = Archetype.find(params[:aid])
     @page_title = @archetype.name + "线报"
    end
  end

  def newactivity
    @user = get_current_user
    @activity = Activity.new
  end

  def follows
    @user = get_current_user
    @follows = @user.follows.paginate(:page => params[:page], :per_page => 10)
    @page_title = "我的关注"
  end

  def followers
    @user = get_current_user
    @users = @user.followers.paginate(:page => params[:page], :per_page => 10)
    @page_title = "谁关注我"
  end

  def following
    @user = get_current_user
    @users = @user.following.paginate(:page => params[:page], :per_page => 10)
    @page_title = "我关注谁"
  end

  def feed
    @user = get_current_user
    @feeds = @user.feeds.paginate(:page => params[:page], :per_page => 20)
    @page_title = "关注动态"
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
  
  def updatepwd
    user = get_current_user
    if user.right_password?(params[:old_password])
      if user.update_attributes(:password => params[:new_password], :password_confirmation => params[:new_password2])
        flash[:notice] = "密码更改成功"
      else
        flash[:error] = "密码更改失败"
      end
    else
      flash[:error] = "旧密码输入不正确"
    end
    p user.errors
    redirect_to setpwd_users_url
  end
  
  def publish
    @photo = PhotoTemp.find(params[:photo_temp_id])
    @user = get_current_user
  end
  
  def postshare
    @current_user = get_current_user
    article = Article.new(
      :title    => params[:title], 
      :content  => params[:content], 
      :user_id  => current_user_id,
      :state    => current_user_rtype,
      :tag_list => params[:tag_list])
    
    # poster
    # TODO: not well.....but iam sooo tired
    if params[:photo_temp_id].present?
      tmpfile = PhotoTemp.find(params[:photo_temp_id])
      article.poster = open(tmpfile.file.path)
    end

    if article.save
  
      # archetype's articles
      if params[:archetype_id].present?
        archetype = Archetype.find(params[:archetype_id])
        archetype.articles << article
        article.update_attributes(
          :category_id => archetype.category_id, 
          :channel_id  => archetype.channel_id, 
          :area_id     => archetype.area_id,
          :shareto     => true
        )
      end

      # activity
      if params[:activity_id].present?
        activity = Activity.find(params[:activity_id])
        activity.articles << article
        article.update_attributes(:shareto => true)
      end
      
      if params[:items].present?
        items = params[:items]
        categories = items['category']
        names      = items['name']
        brands     = items['brand']
        uniqueids  = items['uniqueid']
        prices     = items['price']
        buy_places = items['buy_place']
        posters    = items['poster']
        i = 0
        names.count.times do
          article_item            = ArticleItem.new
          article_item.article_id = article.id
          article_item.category   = categories[i]
          article_item.name       = names[i]
          article_item.brand      = brands[i]
          article_item.unique_id  = uniqueids[i]
          article_item.price      = prices[i]
          article_item.buy_place  = buy_places[i]
          article_item.poster     = posters[i]     if posters.present?
          article_item.user_id    = current_user_id
          article_item.save
          i += 1
        end
      end
  
      User.update_counters current_user_id, :articles_count => 1, :scores => 1

      @done = true
      @current_user.win("postshare")
      @targeturl = article_url(article)
    else
      @done = false
      @targeturl = user_url(current_user_id)
    end


    respond_to do |format|
      format.html { redirect_to @targeturl }
      format.js
    end
    
  end
  
  def postdiscover
    report         = ActivityReport.new
    report.user_id = current_user_id
    report.content = params[:content]
    if report.save
      flash[:notice] = "添加成功"
      redirect_to user_url(current_user_id)
    else
      flash[:error] = "添加失败"
      redirect_to discover_users_url
    end
  end

  def postactivity
    activity         = Activity.new(params[:activity])
    activity.user_id = current_user_id
    activity.latitude  = params[:latitude]  if params[:latitude].present?
    activity.longitude = params[:longitude] if params[:longitude].present?
    if activity.save
      flash[:notice] = "添加成功"
      redirect_to activity
    else
      flash[:error] = "添加失败"
      redirect_to discover_users_url
    end
  end

  def postreport
    report         = Report.new(params[:report])
    report.user_id = current_user_id
    if report.save
      files = params[:photos].present? ? params[:photos][:file] : []
      files.each do |file|
        Photo.create(:file => file, :klass_type => "Report", :klass_id => report.id) if file.present?
      end
      flash[:notice] = "线报添加成功"
      redirect_to user_url(current_user_id)
    else
      flash[:error] = "线报添加失败"
      redirect_to find_users_url
    end
  end

  def postapply
    apply              = Apply.new
    apply.user_id      = current_user_id
    apply.archetype_id = params[:aid]
    apply.reason       = params[:reason]
    if apply.save
      flash[:notice] = "申请成功"
    else
      flash[:error]  = "申请失败"
    end
    redirect_to user_url(current_user_id)
  end
  
  def follow
    @user = User.find(params[:id])
    @current_user = get_current_user
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
    @current_user = get_current_user
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
