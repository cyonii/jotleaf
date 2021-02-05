class VotesController < ApplicationController
  before_action :require_login!

  def create
    vote = current_user.votes.build(vote_params)
    redirect_to jot_path(vote.jot), notice: 'Voted' if vote.save
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    redirect_to jot_path(params[:jot_id]), alert: 'Unvoted'
  end

  private

  def vote_params
    params.permit(:jot_id)
  end
end
