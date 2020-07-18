require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'associations' do
    it { should belong_to(:user).with_foreign_key(:user_id).class_name('User') }
    it { should belong_to(:article).with_foreign_key(:article_id).class_name('Article') }
  end
end
