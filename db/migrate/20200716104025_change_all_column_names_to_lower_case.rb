class ChangeAllColumnNamesToLowerCase < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Name, :name
    rename_column :articles, :AuthorId, :author_id
    rename_column :articles, :Title, :title
    rename_column :articles, :Text, :text
    rename_column :articles, :Image, :image
    rename_column :categories, :Name, :name
    rename_column :categories, :Priority, :priority
    rename_column :votes, :UserId, :user_id
    rename_column :votes, :ArticleId, :article_id
    rename_column :article_categories, :CategoryId, :category_id
    rename_column :article_categories, :ArticleId, :article_id
  end
end
