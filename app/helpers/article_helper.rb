module ArticleHelper
  def featured_title(article)
    article.first.Title
  end

  def featured_image(article)
    article.first.Image
  end

  def featured_content(article)
    article.first.Text.truncate(100, separator: ' ', omission: '.... (continued)')
  end
end
