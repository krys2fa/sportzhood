module CommentHelper
  def time_commented_afterwards(comment)
    distance_of_time_in_words(comment.article.created_at, comment.created_at)
  end
end
