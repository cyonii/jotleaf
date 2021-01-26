module VotesHelper
  def vote_button(jot)
    vote = Vote.find_by(jot: jot, user: current_user)

    if vote
      link_to('Unvote', jot_vote_path(jot, vote), method: :delete, class: 'btn btn-warning fw-bold')
    else
      link_to('Vote', jot_votes_path(jot), method: :post, class: 'btn btn-primary fw-bold')
    end
  end
end
