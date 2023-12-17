FactoryBot.define do
  factory :recipe do
    name { 'Test Recipe' }
    preparation_time { 30 }
    cooking_time { 60 }
    description { 'Test Description' }
    public { false }
    user
  end
end
