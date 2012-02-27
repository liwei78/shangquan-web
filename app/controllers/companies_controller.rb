#encoding: utf-8
class CompaniesController < ApplicationController
  before_filter :need_user_login, :except => [:show]
  def show
    @company = Company.find(params[:id])
    @comments = @company.comments.paginate(:page => params[:page], :per_page => 10)
  end
  
  def visited
    company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def favorite
    company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def share
    company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def write
    company = Company.find(params[:id])
    comment = company.comments.new(:content => params[:content], :user_id => current_user_id)
    if comment.save
      company.increment!(:comments_count)
      flash[:notice] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    redirect_to :back
  end
  
end