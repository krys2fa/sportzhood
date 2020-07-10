class VotesController < ApplicationController
  before_action :set_current_user

  def create
    @vote = @current_user.votes.new(ArticleId: params[:article_id])
    category = Article.find_by(id: 1).categories.first

    if @vote.save
      redirect_to category_path(category), notice: 'You voted for an article'
    else
      redirect_to category_path(category), alert: 'You unvoted an article'
    end

  end

  def destroy
    @vote = Vote.find_by(id: params[:id], user: @current_user, ArticleId: params[:article_id])
    category = Article.find_by(id: 1).categories.first

    if @vote
      @vote.destroy
      redirect_to category_path(category), notice: 'You unvoted an article'
    else
      redirect_to category_path(category), alert: 'Cannot unvote without voting first!'
    end
  end

end
