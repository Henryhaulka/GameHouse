module VotesHelper
  def vote_or_unvote(league, voters)
    if !voters
      link_to 'Vote', votes_path(league_id: league.id), method: :post, action: :create, class: 'btn btn-success'
    elsif voters
      link_to 'Unvote', vote_path(league_id: @league.id), method: :delete, class: 'btn btn-danger'
    end
  end
end
