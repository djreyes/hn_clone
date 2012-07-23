class LinksController < ApplicationController
  def show
    # test
  end

  def edit
  end

  def create
    @link = Link.new(params[:link])
    @link.save
    redirect_to root_path
  end

  def destroy
  end

  def index
    @links = Link.scoped.page(params[:page]).per(2)
  end

  def new
    @link = Link.new
  end
end
