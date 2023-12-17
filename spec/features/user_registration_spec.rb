require 'rails_helper'

RSpec.feature 'User registration', type: :feature do
  background do
    visit new_user_registration_path
  end

  scenario 'User registers a new account' do
    fill_in 'Name', with: 'New User'
    fill_in 'Email', with: 'newuser@example.com'
    fill_in 'Password', with: 'securepassword'
    fill_in 'Password confirmation', with: 'securepassword'
    click_button 'Sign up'
  end
end
