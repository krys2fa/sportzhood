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

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  # def create
  #   @vote = Vote.new(vote_params)

  #   respond_to do |format|
  #     if @vote.save
  #       format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
  #       format.json { render :show, status: :created, location: @vote }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @vote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  # def destroy
  #   @vote.destroy
  #   respond_to do |format|
  #     format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:UserId, :ArticleId)
    end
end
