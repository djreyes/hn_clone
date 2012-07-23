class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def show
    # test
  end

  def edit
  end

  def create
    current_user.links.create(params[:link])
    redirect_to root_path
  end

  def destroy
  end

  def index
    @links = Link.scoped.page(params[:page]).per(20)
  end

  def new
    @link = Link.new
  end
end
