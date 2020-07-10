module ArticleHelper

  def featured_owner(article)
    article.first.user.Name
  end

  def featured_title(article)
    article.first.Title
  end

  def featured_content(article)
    article.first.Text
  end

end
