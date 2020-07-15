require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:Name) }
    it { should validate_length_of(:Name).is_at_least(3) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(12) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
