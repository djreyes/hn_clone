class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_banned, :except => :index

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def authenticate_banned
    if current_user.nil?
    elsif current_user.banned?
      redirect_to root_path
    end
  end
end
