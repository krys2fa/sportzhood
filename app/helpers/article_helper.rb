module ArticleHelper
  def featured_title(article)
    article.try(:title)
  end

  def featured_image(article)
    article.try(:image).try(:feature_show).try(:url)
  end

  def featured_content(article)
    article.try { |a| a.text.truncate(100, separator: ' ', omission: '.... (continued)') }
  end

  def number_of_comments(article)
    article.comments.size
  end

  def number_of_votes(article)
    article.votes.size
  end

  def author_name(article)
    article.user.name
  end

  def latest_article_background(category)
    "#{category.articles.last.image.category_show.url}".html_safe if category.articles.any?
  end
end
