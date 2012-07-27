class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_banned, :except => :index

  def authenticate_admin
    redirect_to root_path unless current_user.admin?
  end

  def authenticate_banned
    redirect_to root_path if current_user.banned? unless current_user.nil?
  end
end
