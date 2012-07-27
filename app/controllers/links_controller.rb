class LinksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @parent = Link.find(params[:id])
    @comments = @parent.comments
    @comment = Comment.new
    @link_comments = Comment.where("commentable_type = 'Link' AND commentable_id = #{@parent.id}").find_with_reputation(:votes, :all, order: 'votes desc, created_at desc')
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
    @link.update_title_and_url(params) if params[:type] != "flag"
    @link.toggle_invisibility if params[:type] == "flag"
    if @link.save
      flash[:success] = "Link updated!"
    else
      flash[:error] = @link.errors.messages[:error].first
    end
    redirect_to root_path
  end

  def index
    links_sorted_by_vote = Link.find_with_reputation(:votes, :all, order: 'votes desc')
    links_sorted_by_vote.select! { |x| x.invisible != true } if !current_user.admin?
    @links = Kaminari.paginate_array(links_sorted_by_vote).page(params[:page]).per(20)
  end

  def new
    @link = Link.new
  end
end
