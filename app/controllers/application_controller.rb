class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_charset

  RAILS_ROOT='/home/hokui93/app/med93'

  protect_from_forgery

  private
  def set_charset
    headers["Content-Type"] = "text/html; charset=UTF-8"
  end

  def authorize
    if session[:user_id].blank? or User.find(session[:user_id]).blank?
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def admin_authorize
    unless User.find(session[:user_id]).authority=="admin" or User.find(session[:user_id]).authority=="system"
      redirect_to controller: 'index', action: 'index', notice: 'you do not have a permission.'
    end
  end

  def system_authorize
    unless User.find(session[:user_id]).authority=="system"
      redirect_to controller: 'index', action: 'index', notice: 'you do not have a permission.'
    end
  end
end
