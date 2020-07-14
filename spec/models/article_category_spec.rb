require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:category).with_foreign_key(:CategoryId).class_name('Category') }
    it { should belong_to(:article).with_foreign_key(:ArticleId).class_name('Article') }
  end
end
