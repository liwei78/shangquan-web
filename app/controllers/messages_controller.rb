#encoding: utf-8
class MessagesController < ApplicationController
  before_filter :need_user_login
  
  def index
    @user = get_current_user
    @messages = @user.messages.sysmsg.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  end
  
  def my
    @user = get_current_user
    @messages = @user.messages.mymsg.paginate(:page => params[:page], :per_page => 10, :order => "id desc")
  end

  def new
    @target_user = User.find(params[:to])
    @user = get_current_user
    @message = Message.new(:user_id => @target_user.id)
  end

  def create
    message = Message.new(params[:message])
    user = get_current_user
    message.title = "#{user.name}给你发送的消息"
    message.send_by = user.id
    if message.save
      flash[:notice] = "发送成功"
    else
      flash[:error] = "发送失败"
    end
    redirect_to my_messages_url
  end
  
  def show
    @user = get_current_user
    @message = @user.messages.find(params[:id])
    @message.update_attribute(:read, true) unless @message.read?
  end

  def destroy
    @user = get_current_user
    @message = @user.messages.find(params[:id])
    sysmsg = @message.sysmsg
    if @message and @message.destroy
      flash[:notice] = "删除成功"
      burl = sysmsg ? messages_url : my_messages_url
    else
      flash[:error] = "删除失败"
      burl = :back
    end
    redirect_to burl
  end

end
