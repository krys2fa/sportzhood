require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:article_categories).with_foreign_key(:category_id) }
    it { should have_many(:articles).through(:article_categories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
    it { should validate_uniqueness_of(:priority) }
    it { should validate_length_of(:name).is_at_least(4) }
  end
end
