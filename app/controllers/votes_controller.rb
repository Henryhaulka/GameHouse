class VotesController < ApplicationController
  def create
    if Vote.where(league_id: League.find(params[:league_id]), user_id: current_user.id).exists?
      return redirect_to root_path, notice: 'You already voted for this League '
    end
    @vote = League.find(params[:league_id]).votes.build(user_id: current_user.id)
    return unless @vote.save redirect_to league_path(id: League.find(params[:league_id])),notice: 'Thanks!!! You have successfully voted for this League' 
  end

  def destroy
    @league = League.find(params[:league_id])
    @vote = Vote.find_by(league_id: @league.id, user: current_user.id)
    redirect_to league_path(id: @league.id), notice: 'You have unvoted this league' if @vote.destroy
  end
end
