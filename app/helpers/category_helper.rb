module CategoryHelper

  def vote_button(article)
    vote = Vote.find_by(user: @current_user, article: article)

    if vote
      link_to('UnVote', article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'btn btn-danger')
    else
      link_to('Vote', article_votes_path(article.id), method: :post, class: 'btn btn-success')
    end
  end

end
