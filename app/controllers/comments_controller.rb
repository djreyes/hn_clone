class CommentsController < ApplicationController
  def index
  end

  def show
    @parent = Comment.find(params[:id])
    @comment = Comment.new
  end

  def update
  end

  def create
    comment = Comment.new(params[:comment])
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
