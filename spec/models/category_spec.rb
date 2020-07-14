require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'associations' do
    it { should have_many(:article_categories).with_foreign_key(:CategoryId) }
    it { should have_many(:articles).through(:article_categories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:Name) }
    it { should validate_presence_of(:Priority) }
    it { should validate_uniqueness_of(:Priority) }
    it { should validate_length_of(:Name).is_at_least(4) }
  end

end
