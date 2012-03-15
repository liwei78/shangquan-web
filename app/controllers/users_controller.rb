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
    @nav_all = "on"
    @page_title = @user.name + "的空间"
    render :layout => "layoutfullwidth"
  end
  
  # def articles
  #   @user = User.find(params[:id])
  #   @articles = @user.articles.is_article.paginate(:page => params[:page], :per_page => 5)
  #   @nav_articles = "on"
  # end
  # 
  # def photos
  #   @user = User.find(params[:id])
  #   @articles = @user.articles.is_photo.paginate(:page => params[:page], :per_page => 5)
  #   @nav_photos = "on"
  # end
  # 
  # def videos
  #   @user = User.find(params[:id])
  #   @articles = @user.articles.is_video.paginate(:page => params[:page], :per_page => 5)
  #   @nav_videos = "on"
  # end
  # 
  # def activities
  #   @user = User.find(params[:id])
  #   @activities = @user.articles.is_activity.paginate(:page => params[:page], :per_page => 5)
  #   @nav_activities = "on"
  # end
  # 
  # def companies
  #   @user = User.find(params[:id])
  #   @activities = @user.articles.is_company.paginate(:page => params[:page], :per_page => 5)
  #   @nav_activities = "on"
  # end
  # 
  # def brands
  #   @user = User.find(params[:id])
  #   @brands = @user.articles.is_brand.paginate(:page => params[:page], :per_page => 5)
  #   @nav_brands = "on"
  # end
  # 
  # def goods
  #   @user = User.find(params[:id])
  #   @goods = @user.articles.is_good.paginate(:page => params[:page], :per_page => 5)
  #   @nav_goods = "on"
  # end
  
  
  
  def setting
    @user = get_current_user
  end
  
  def avatarsetting
    @user = get_current_user
  end
  
  def upgrade
    @user = get_current_user
  end
  
  
  
  # def write
  #   @user = get_current_user
  # end
  # 
  # def upload
  #   @user = get_current_user
  # end
  # 
  # def pubvideo
  #   @user = get_current_user
  # end
  # 
  # def pubgood
  #   @user = get_current_user
  # end
  # 
  # def pubactivity
  #   @user = get_current_user
  # end
  # 
  # def pubbrand
  #   @user = get_current_user
  # end
  
  # def publish
  #   @user = get_current_user
  # end
  
  def share
    @user = get_current_user
  end
  
  
  # def postcontent
  #   article = Article.new(:title => params[:title], :content => params[:content], :article_type => 'article', :tag_list => params[:tag_list])
  #   article.poster = params[:poster]
  #   article.user_id = current_user_id
  #   article.resource_type = current_user_promotion
  #   if article.save
  #     User.update_counters current_user_id, :articles_count => 1
  #     flash[:notice] = "发布成功"
  #   else
  #     flash[:error] = "发布失败"
  #   end
  #   redirect_to articles_user_url(current_user_id)
  # end
  # 
  # def uploadphoto
  #   article = Article.new(:title => params[:title], :content => params[:content], :article_type => 'photo')
  #   article.user_id = current_user_id
  #   article.resource_type = current_user_promotion
  #   article.save
  #   files = params[:photos].present? ? params[:photos][:file] : []
  #   files.each do |file|
  #     Photo.create(:file => file, :klass_type => "Article", :klass_id => article.id) if file.present?
  #   end
  #   redirect_to photos_user_url(current_user_id)
  # end
  # 
  # def postvideo
  #   article = Article.new(:title => params[:title], :content => params[:content], :code => params[:code], :article_type => 'video')
  #   article.user_id = current_user_id
  #   article.resource_type = current_user_promotion
  #   article.save
  #   redirect_to videos_user_url(current_user_id)
  # end
  # 
  # def postgood
  #   good = Good.new(:title => params[:title], :price => params[:price], :content => params[:content], :poster => params[:poster])
  #   good.user_id = current_user_id
  #   good.resource_type = current_user_promotion
  #   good.save
  #   files = params[:photos].present? ? params[:photos][:file] : []
  #   files.each do |file|
  #     Photo.create(:file => file, :klass_type => "Good", :klass_id => good.id) if file.present?
  #   end
  #   redirect_to goods_user_url(current_user_id)
  # end
  # 
  # def postactivity
  #   activity = Activity.new(
  #     :title => params[:title], 
  #     :content => params[:content], 
  #     :poster => params[:poster], 
  #     :tag_list => params[:tag_list], 
  #     :activity_category => params[:activity_category], 
  #     :activity_area => params[:activity_area],
  #     :schedule => params[:schedule], 
  #     :address => params[:address])
  #   activity.user_id = current_user_id
  #   activity.resource_type = current_user_promotion
  #   activity.save
  #   redirect_to activities_user_url(current_user_id)
  # end
  # 
  # def postbrand
  #   brand = Article.new(:title => params[:title], :content => params[:content], :poster => params[:poster], :article_type => 'brand', :tag_list => params[:tag_list])
  #   brand.user_id = current_user_id
  #   brand.resource_type = current_user_promotion
  #   brand.save
  #   redirect_to brands_user_url(current_user_id)
  # end

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
    user = User.find(current_user_id)
    user.role = params[:role]
    if user.save
      flash[:notice] = '保存成功！'
    else
      flash[:error] = '保存失败！'
    end
    redirect_to :back
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
      
      # good
      if params[:relate_5] == "5"
        article.price = params[:price]
        article.is_good = true
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
  
end
