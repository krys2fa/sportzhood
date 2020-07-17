require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do
  before :each do
    User.create(name: 'User', email: 'user@mail.com')
  end

  it 'Should log in' do
    visit sessions_path
    fill_in 'Name', with: 'User'
    click_button 'commit'
    expect(page).to have_content('WRITE AN ARTICLE')
  end

  it 'Should sign up' do
    visit new_user_path
    fill_in 'Name', with: 'administrator'
    fill_in 'Email', with: 'adm@admin.com'
    click_button 'commit'
    expect(page).to have_content('WRITE AN ARTICLE')
  end

  it 'Should sign out' do
    visit sessions_path
    fill_in 'Name', with: 'User'
    click_button 'commit'
    click_link 'Log out'
    expect(page).to have_content('Please Sign In')
  end
end
