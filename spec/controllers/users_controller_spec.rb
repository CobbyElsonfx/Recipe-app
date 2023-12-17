require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { create(:user) }

    before do
      sign_in user
      get :show, params: { id: user.id }
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq(user)
    end
  end
end
