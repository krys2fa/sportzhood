require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe 'associations' do
    it { should belong_to(:user).with_foreign_key(:UserId).class_name('User') }
    it { should belong_to(:article).with_foreign_key(:ArticleId).class_name('Article') }
  end

end
