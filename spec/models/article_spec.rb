require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:text).is_at_least(5) }
  end

  describe 'associations' do
    it { should belong_to(:user).with_foreign_key(:author_id).class_name('User') }
    it { should have_many(:article_categories).with_foreign_key(:article_id) }
    it { should have_many(:categories).through(:article_categories) }
    it { should have_many(:votes).with_foreign_key(:article_id).class_name('Vote') }
    it { should have_many(:comments) }
    it { should have_many(:taggings) }
    it { should have_many(:tags).through(:taggings) }
  end
end
