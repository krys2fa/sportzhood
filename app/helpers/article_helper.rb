module ArticleHelper
  def featured_title(article)
    article.try(:Title)
  end

  def featured_image(article)
    article.try(:Image).try(:feature_show).try(:url)
  end

  def featured_content(article)
    article.try { |a| a.Text.truncate(100, separator: ' ', omission: '.... (continued)') }
  end

  def number_of_comments(article)
    article.comments.size
  end

  def number_of_votes(article)
    article.votes.size
  end

  def author_name(article)
    article.user.Name
  end
end
