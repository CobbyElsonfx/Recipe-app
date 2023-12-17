require 'rails_helper'

RSpec.describe 'public_recipes/index', type: :view do
  before(:each) do
    assign(:public_recipes, [
             FactoryBot.create(:recipe, name: 'Recipe 1', public: true),
             FactoryBot.create(:recipe, name: 'Recipe 2', public: true)
           ])

    allow(view).to receive(:calculate_total_price_from_recipe_foods).and_return('Some Price')
  end

  it 'renders a list of public recipes' do
    render
    expect(rendered).to match(/Recipe 1/)
    expect(rendered).to match(/Recipe 2/)
    expect(rendered).to match(/Some Price/)
  end
end
