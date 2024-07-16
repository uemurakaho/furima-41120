FactoryBot.define do
  factory :order_address do
    user_id       {Faker::Number.between(from: 1, to: 10)}
    item_id       {Faker::Number.between(from: 1, to: 10)}
    postcode      {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {Faker::Address.city}
    block         {Faker::Address.street_address}
    building      {Faker::Company.name}
    phone_number  {Faker::Number.leading_zero_number(digits: 11)}
    token         {Faker::Alphanumeric.alphanumeric(number: 30)}
  end
end
