class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_current_user

  def index
    @categories = Category.all
  end

  def show
    @category_articles = @category.articles.order('id DESC').limit(4)
  end

  def new
    @category = Category.new
    # @last_priority = Category.last.priority
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def category_link
    category = Category.where(Name: params[:Name])
    category.articles
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:Name, :Priority)
  end
end
