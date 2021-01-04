FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.initials(number: 2) }
    email                    { Faker::Internet.free_email }
    password                 { Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    first_name               { '鈴木' }
    last_name                { '太郎' }
    first_name_reading       { 'スズキ' }
    last_name_reading        { 'タロウ' }
    birthday                 { Faker::Date.backward }
  end
end
