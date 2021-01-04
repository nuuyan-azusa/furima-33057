FactoryBot.define do
  factory :item do
    name                 { '商品名' }
    text                 { Faker::Lorem.sentence }
    category_id          { 1 }
    state_id             { 1 }
    delivery_fee_id      { 1 }
    prefecture_id        { 1 }
    delivery_by_day_id   { 1 }
    price                { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
