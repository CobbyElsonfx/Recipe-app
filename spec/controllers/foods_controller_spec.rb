require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    { name: 'Apple', measurement_unit: 'kg', price: 1.5, quantity: 10, user_id: user.id }
  end
  let(:invalid_attributes) do
    { name: '', measurement_unit: '', price: nil, quantity: nil }
  end

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the foods list' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Food' do
        expect do
          post :create, params: { food: invalid_attributes }
        end.to change(Food, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      food = Food.create! valid_attributes
      expect do
        delete :destroy, params: { id: food.id }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods list' do
      food = Food.create! valid_attributes
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
    end
  end
end
