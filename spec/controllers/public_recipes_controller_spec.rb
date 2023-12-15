# spec/controllers/public_recipes_controller_spec.rb
require 'rails_helper'

RSpec.describe PublicRecipesController, type: :controller do
  render_views
  describe 'GET #index' do
    it 'displays public recipes' do
      user = create(:user)
      sign_in user

      recipe = Recipe.create!(
        name: 'Test Recipe',
        preparation_time: 30,
        cooking_time: 60,
        description: 'Test Description',
        public: true,
        user:
      )

      get :index
      expect(Recipe.exists?(recipe.id)).to be true # Confirma que la receta se guardó
      expect(response.body).to include('Test Recipe')
    end
  end
end
