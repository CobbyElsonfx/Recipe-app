require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    user = FactoryBot.create(:user)
    allow(view).to receive(:current_user).and_return(user)

    @recipe = FactoryBot.create(:recipe, user:)
    assign(:recipe, @recipe)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{@recipe.name}/)
    expect(rendered).to match(/#{@recipe.preparation_time}/)
    expect(rendered).to match(/#{@recipe.cooking_time}/)
    expect(rendered).to match(/#{@recipe.description}/)
  end

  it "renders the recipe's public/private status correctly" do
    render
    if @recipe.public
      expect(rendered).to match(/Make Recipe Private/)
    else
      expect(rendered).to match(/Make Recipe Public/)
    end
  end
end
