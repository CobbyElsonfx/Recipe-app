require 'rails_helper'

RSpec.describe 'foods/new', type: :view do
  before do
    assign(:food, Food.new)
  end

  it 'renders new food form' do
    render
    assert_select 'form[action=?][method=?]', foods_path, 'post' do
      assert_select 'input[name=?]', 'food[name]'
      assert_select 'select[name=?]', 'food[measurement_unit]'
      assert_select 'input[name=?]', 'food[price]'
    end
  end
end
