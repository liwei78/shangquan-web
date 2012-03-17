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
