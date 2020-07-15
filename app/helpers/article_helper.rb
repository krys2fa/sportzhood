module ArticleHelper
  def featured_title(article)
    article.first.try(:Title)
  end

  def featured_image(article)
    article.first.try(:Image).try(:feature_show).try(:url)
  end

  def featured_content(article)
    article.first.try { |a| a.Text.truncate(100, separator: ' ', omission: '.... (continued)') }
  end
end
