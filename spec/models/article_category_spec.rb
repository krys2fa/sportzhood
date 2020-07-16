require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:category).with_foreign_key(:category_id).class_name('Category') }
    it { should belong_to(:article).with_foreign_key(:article_id).class_name('Article') }
  end
end
