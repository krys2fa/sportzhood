class CommentsController < ApplicationController
  before_action :set_current_user, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    if @comment.save
      flash[:notice] = 'Your comment was created successfully!'
      redirect_to article_path(@comment.article)
    else
      @article = Article.find(params[:article_id])
      flash[:alert] = 'Sorry, something went wrong...'
      redirect_to article_path(@article)
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
