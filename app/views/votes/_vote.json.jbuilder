json.extract! vote, :id, :UserId, :ArticleId, :created_at, :updated_at
json.url vote_url(vote, format: :json)
