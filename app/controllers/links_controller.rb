class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def show
    # test
  end

  def edit
    @link = Link.find(params[:id])
    if @link.user_id != current_user.id
      flash[:error] = "Wrong user!"
      redirect_to root_path
    end
  end

  def create
    current_user.links.create(params[:link])
    redirect_to root_path
  end

  def destroy
  end

  def update
    @link = Link.find(params[:id])
    @link.title = params[:link][:title]
    @link.url = params[:link][:url]
    @link.save
    redirect_to root_path
  end

  def index
    @links = Link.scoped.page(params[:page]).per(20)
  end

  def new
    @link = Link.new
  end
end
