require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }

    before do
      sign_in user
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
