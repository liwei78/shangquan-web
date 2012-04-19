# encoding: utf-8
class CouponsController < ApplicationController
  def show
    @user = get_current_user
    @coupon = Coupon.find(params[:id])
  end
end
