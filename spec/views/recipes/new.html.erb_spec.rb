require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  before do
    assign(:recipe, Recipe.new)
  end

  it 'renders new recipe form' do
    render
    assert_select 'form[action=?][method=?]', recipes_path, 'post' do
      assert_select 'input[name=?]', 'recipe[name]'
      assert_select 'textarea[name=?]', 'recipe[description]'
      assert_select 'input[name=?]', 'recipe[preparation_time]'
      assert_select 'input[name=?]', 'recipe[cooking_time]'
    end
  end
end
