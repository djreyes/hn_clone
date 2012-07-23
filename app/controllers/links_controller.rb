class LinksController < ApplicationController
  def show
    # test
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end
end
