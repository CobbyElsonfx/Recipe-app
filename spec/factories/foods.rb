FactoryBot.define do
  factory :food do
    name { 'Apple' }
    measurement_unit { 'kg' }
    price { 1.5 }
    quantity { 10 }
    user
  end
end
