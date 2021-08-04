class VotesController < ApplicationController
  def create
    if Vote.where(league_id: params[:league_id], user_id: current_user.id).exists?
      return redirect_to root_path, notice: 'You already voted for this League '
    end

    # rubocop:disable Layout/LineLength
    # goes to the League table(not the vote table) to find params
    @vote = League.find(params[:league_id]).votes.build(user_id: current_user.id)
    redirect_to league_path(id: params[:league_id]), notice: 'Thanks!!! You have successfully voted for this League' if @vote.save
    # rubocop:enable Layout/LineLength
  end

  def destroy
    @vote = Vote.find_by(league_id: params[:league_id], user_id: current_user.id)
    redirect_to league_path(id: params[:league_id]), notice: 'You have unvoted this league' if @vote.destroy
  end
end
