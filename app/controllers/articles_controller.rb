#encoding: utf-8
class ArticlesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    render :layout => "users"
  end  


end
