class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_current_user

  def index
    @articles = Article.all
    @featured = Article.featured_article
    @categories = Category.order(:Priority).limit(4).includes(:articles)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = @current_user.articles.build(article_params)
    # @value = Cloudinary::Uploader.upload(params[:Image])
    # @article = Article.new({:Image => @value['secure_url'],
    #                         :Title => params[:Title],
    #                         :Text => params[:Text],
    #                         :AuthorId => @current_user.id})

    respond_to do |format|
      if @article.save
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
      if @article.update(article_params)
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
    params.require(:article).permit(:Title, :Text, :Image)
  end
end
