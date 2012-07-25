class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments
    @comment = Comment.new
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
    @links_sorted_by_vote = Link.find_with_reputation(:votes, :all, order: 'votes desc')
    @links = Kaminari.paginate_array(@links_sorted_by_vote).page(params[:page]).per(20)
  end

  def new
    @link = Link.new
  end
end
