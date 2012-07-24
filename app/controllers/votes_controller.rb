class VotesController < ApplicationController
  def edit
  end

  def create
    value = params[:type] == "up" ? 1 : -1
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
