class VotesController < ApplicationController
  def edit
  end

  def create
    value = params[:type] == "up" ? 1 : -1
    @link = Link.find(params[:id])
    @link.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

  def show
    @link = Link.find(params[:id])
    redirect_to :back, notice: "Thank you for voting"
  end

end
