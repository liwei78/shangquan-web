#encoding: utf-8
class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
    @user = User.find(params[:user_id])
    @nav_goods = 'on'
    render :layout => "users"
  end
  
  def view
    @good = Good.find(params[:id])
    @comments = @good.comments.paginate(:page => params[:page], :per_page => 10)
    @nav_goods = 'on'
  end
  
  def write
    good = Good.find(params[:id])
    comment = good.comments.new(:content => params[:content], :user_id => current_user_id)
    if comment.save
      flash[:notice] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    redirect_to :back
  end
  
  def like
    @good = Good.find(params[:id])
    @good.increment!(:likes_count)
    respond_to do |format|
      format.html
      format.js
    end
  end
end