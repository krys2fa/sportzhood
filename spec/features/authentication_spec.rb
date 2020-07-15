require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(Name: 'User', email: 'user@mail.com')
  end

  it 'Should log in' do
    visit sessions_path
    fill_in 'Name', with: 'User'
    click_button 'commit'
    expect(page).to have_content('WRITE AN ARTICLE')
  end

  # it 'Should sign up' do
  #   visit new_user_registration_path
  #   fill_in 'Name', with: 'administrator'
  #   fill_in 'Email', with: 'adm@admin.com'
  #   fill_in 'Password', with: 'administrator'
  #   fill_in 'Password confirmation', with: 'administrator'
  #   click_button 'commit'
  #   expect(page).to have_content('Recent posts')
  # end

  # it 'Should sign out' do
  #   visit new_user_session_path
  #   fill_in 'Email', with: 'user@mail.com'
  #   fill_in 'Password', with: 'asdqwe'
  #   click_button 'commit'
  #   expect(page).to have_content('Recent posts')
  #   click_link 'Sign out'
  # end
end
