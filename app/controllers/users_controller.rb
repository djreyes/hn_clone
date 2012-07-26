class UsersController < ApplicationController
  before_filter :authenticate_admin

  def index
    @users = User.order("email ASC")
  end

  def edit
  end

  def new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.ban_status(params)
    @user.admin_status(params)
    @user.save
    redirect_to users_path
  end

  def create
  end

  def destroy
  end
end
