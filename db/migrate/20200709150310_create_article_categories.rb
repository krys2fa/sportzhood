class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.integer :CategoryId
      t.integer :ArticleId

      t.timestamps
    end
  end
end
