module CategoryHelper
  def vote_button(article)
    vote = Vote.find_by(user: @current_user, article: article)

    if vote
      link_to('UnVote', article_vote_path(id: vote.id, article_id: article.id),
              method: :delete, class: 'btn btn-danger')
    else
      link_to('Vote', article_votes_path(article.id), method: :post, class: 'btn btn-success')
    end
  end

  def category_article_title(article)
    article.Title.truncate(30)
  end

  def category_article_text(article)
    article.Text.truncate(100, separator: ' ', omission: '.... (continued)')
  end

  def category_article_link(category)
    link_title = category.articles.pluck(:Title).last.truncate(30)
    article = category.articles.last
    link_to(link_title, article_path(article), class: 'link-title underline')
  end
end
