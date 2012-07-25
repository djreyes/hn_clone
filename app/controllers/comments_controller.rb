class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def create
    @link = Link.find(params[:comment][:commentable_id])
    comment = @link.comments.new(params[:comment])
    comment.user_id = current_user.id
    comment.save

    redirect_to :back, :notice => "comment submitted!"
  end

  def edit
  end

  def destroy
  end

  def new
  end
end
