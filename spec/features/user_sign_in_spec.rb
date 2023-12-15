require 'rails_helper'

RSpec.feature 'User sign in', type: :feature do
  given(:user) do
    User.create!(name: 'Existing User', email: 'existing@example.com', password: 'password',
                 password_confirmation: 'password')
  end

  background do
    visit new_user_session_path
  end

  scenario 'User signs in successfully' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
