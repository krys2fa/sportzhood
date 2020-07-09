class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :Title
      t.text :Text
      t.text :Image
      t.integer :AuthorId

      t.timestamps
    end
  end
end
