require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:Title) }
    it { should validate_presence_of(:Text) }
    it { should validate_presence_of(:Image) }
    it { should validate_presence_of(:Title) }
    it { should validate_length_of(:Title).is_at_least(5) }
    it { should validate_length_of(:Text).is_at_least(5) }
  end

  describe 'associations' do
    it { should belong_to(:user).with_foreign_key(:AuthorId).class_name('User') }
    it { should have_many(:article_categories).with_foreign_key(:ArticleId) }
    it { should have_many(:categories).through(:article_categories) }
    it { should have_many(:votes).with_foreign_key(:ArticleId).class_name('Vote') }
    it { should have_many(:comments) }
    it { should have_many(:taggings) }
    it { should have_many(:tags).through(:taggings) }
  end
end
