require 'rails_helper'

RSpec.feature 'Food management', type: :feature do
  let(:user) do
    create(:user, name: 'Test User', email: 'test@example.com', password: 'password', password_confirmation: 'password')
  end

  background do
    login_as(user, scope: :user)
    visit new_food_path
  end

  scenario 'User adds a new food item' do
    fill_in 'Name', with: 'Banana'
    select 'kilograms', from: 'Measurement unit'
    fill_in 'Price', with: '0.5'
    click_button 'Create Food'

    expect(page).to have_content 'Banana'
  end
end
