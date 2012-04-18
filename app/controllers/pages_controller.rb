# encoding: utf-8
class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @page_title = @page.title
  end
end
