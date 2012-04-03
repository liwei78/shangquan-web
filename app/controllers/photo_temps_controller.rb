# encoding: utf-8
class PhotoTempsController < ApplicationController
  protect_from_forgery :except => :create 
  layout false
  def create
    tmpfile = PhotoTemp.new(:file => params[:Filedata])
    status = tmpfile.save ? "success" : "error"
    respond_to do |format|
      format.html
      format.js
      format.json { render :json => {'status' => status, 'tmpurl' => tmpfile.file.url, 'tmpid' => tmpfile.id}}
    end
  end
end