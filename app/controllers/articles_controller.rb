class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_current_user

  def index
    @articles = Article.all
    @featured = Article.featured_article
    @categories = Category.order(:Priority).limit(4).includes(:articles)
  end

  def show
    # @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = @current_user.articles.build(Title: article_params[:Title],
                                            Text: article_params[:Text],
                                            Image: article_params[:Image],
                                            tag_list: article_params[:tag_list])

    respond_to do |format|
      if @article.save
        ArticleCategory.create(CategoryId: article_params[:category_id], ArticleId: @article.id)
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(Title: article_params[:Title], Text: article_params[:Text], Image: article_params[:Image])
        article_category = ArticleCategory.where(ArticleId: @article.id)
        article_category[0].CategoryId = article_params[:category_id]
        article_category[0].save
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:Title, :Text, :Image, :category_id, :Image_cache, :tag_list)
  end
end
