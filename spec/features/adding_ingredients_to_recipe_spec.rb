require 'rails_helper'

RSpec.describe 'Adding ingredients to a recipe', type: :feature do
  let(:user) { create(:user) }
  let!(:recipe) do
    create(:recipe, name: 'Test Recipe', preparation_time: 30, cooking_time: 60, description: 'Test Description',
                    public: true, user:)
  end
  let!(:food) do
    create(:food, name: 'Test Food', measurement_unit: 'kg', price: 5, quantity: 10, user:)
  end

  before do
    login_as(user, scope: :user)
    visit new_recipe_recipe_food_path(recipe)
  end

  it 'User adds ingredient to a recipe' do
    select 'Test Food', from: 'Food'
    fill_in 'Quantity', with: '2'
    click_button 'Create Recipe food'

    expect(page).to have_current_path(recipe_path(recipe))
    expect(page).to have_content('Test Food')
    expect(page).to have_content('2')
  end
end
