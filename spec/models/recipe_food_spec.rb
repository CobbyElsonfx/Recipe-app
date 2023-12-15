require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:food) }
  end
end
