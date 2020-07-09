class CreateCategoryArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :category_articles do |t|
      t.integer :CategoryId
      t.integer :ArticleId
    end
  end
end
