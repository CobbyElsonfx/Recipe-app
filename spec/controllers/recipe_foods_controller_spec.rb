require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:food) { create(:food, user:) }
  let(:recipe) do
    create(:recipe,
           name: 'Test Recipe',
           preparation_time: 30,
           cooking_time: 60,
           description: 'Test Description',
           user:)
  end
  let(:valid_attributes) do
    { food_id: food.id, quantity: 5 }
  end
  let(:invalid_attributes) do
    { food_id: nil, quantity: nil }
  end

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RecipeFood' do
        expect do
          post :create, params: { recipe_id: recipe.id, recipe_food: valid_attributes }
        end.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the recipe' do
        post :create, params: { recipe_id: recipe.id, recipe_food: valid_attributes }
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end

    context 'with invalid params' do
      it 'does not create a new RecipeFood' do
        expect do
          post :create, params: { recipe_id: recipe.id, recipe_food: invalid_attributes }
        end.to change(RecipeFood, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { recipe_id: recipe.id, recipe_food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  # Aquí puedes añadir pruebas adicionales para 'edit', 'update', 'destroy', etc.
end
