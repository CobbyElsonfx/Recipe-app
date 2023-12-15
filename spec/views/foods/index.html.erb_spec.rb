require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  it 'renders the index view' do
    assign(:foods, create_list(:food, 2))
    render
    expect(rendered).to match(/Apple/)
  end
end
