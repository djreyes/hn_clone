class VotesController < ApplicationController
  def edit
  end

  def create
    value = params[:type] == "up" ? 1 : -1

    if params[:class] == "Comment"
      @comment = Comment.find(params[:id])
      if current_user == nil
        redirect_to new_user_session_path
      elsif @comment.user_id == current_user.id
        flash[:error] = "You can't vote on your own links!"
        redirect_to root_path
      else
        warn "****************************************"
        warn value.inspect
        warn current_user.inspect
        warn @comment.reputation_value_for(:votes).inspect
        warn "****************************************"
        @comment.add_or_update_evaluation(:votes, value, current_user)
        warn @comment.reputation_value_for(:votes).inspect
        warn "****************************************"
        redirect_to :back, notice: "Thank you for voting"
      end
    else
      @link = Link.find(params[:id])
      if current_user == nil
        redirect_to new_user_session_path
      elsif @link.user_id == current_user.id
        flash[:error] = "You can't vote on your own links!"
        redirect_to root_path
      else
        @link.add_or_update_evaluation(:votes, value, current_user)
        redirect_to :back, notice: "Thank you for voting"
      end
    end
  end

end
