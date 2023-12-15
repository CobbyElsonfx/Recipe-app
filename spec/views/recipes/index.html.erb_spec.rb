require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    user = create(:user)

    assign(:recipes, [
             Recipe.create!(
               name: 'Recipe 1',
               preparation_time: 30,
               cooking_time: 60,
               description: 'Test Description 1',
               user:
             ),
             Recipe.create!(
               name: 'Recipe 2',
               preparation_time: 45,
               cooking_time: 75,
               description: 'Test Description 2',
               user:
             )
           ])
  end

  it 'renders a list of recipes' do
    render

    expect(rendered).to match(/Recipe 1/)
    expect(rendered).to match(/Recipe 2/)
  end
end
