FactoryBot.define do
  factory :item do
    name                 { "商品名" }
    text                 { Faker::Lorem.sentence }
    category_id          { 1 }
    state_id             { 1 }
    delivery_fee_id      { 1 }
    prefecture_id        { 1 }
    delivery_by_days_id  { 1 }
    price                { 2000 }
    association :user
  end
end
