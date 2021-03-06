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
    pluralize(article.comments.size, 'comment')
  end

  def number_of_votes(article)
    pluralize(article.votes.size, 'vote')
  end

  def author_name(article)
    article.user.name
  end

  def latest_article_background(category)
    category.articles.last.image.category_show.url.to_s.html_safe if category.articles.any?
  end

  def featured_title_link(article)
    link_to(featured_title(article), article_path(article), class: 'link-title underline') if article
  end
end
