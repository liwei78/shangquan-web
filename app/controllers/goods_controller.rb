class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end
end