require 'rails_helper'

RSpec.feature 'Viewing public recipes', type: :feature do
  given!(:public_recipe) { create(:recipe, name: 'Public Recipe', public: true) }

  scenario 'Visitor views public recipes' do
    visit public_recipes_index_path

    expect(page).to have_content 'Public Recipes'
    expect(page).to have_content 'Public Recipe'
  end
end
