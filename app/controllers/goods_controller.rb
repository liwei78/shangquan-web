class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
    @user = User.find(params[:user_id])
    @nav_goods = 'on'
    render :layout => "users"
  end
end