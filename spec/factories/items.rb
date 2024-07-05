FactoryBot.define do
  factory :item do
    name              {Faker::Lorem.word}
    content           {Faker::Lorem.sentence}
    category_id       {Category.all.sample.id}
    status_id         {Status.all.sample.id}
    fee_status_id     {FeeStatus.all.sample.id}
    prefecture_id     {Prefecture.all.sample.id}
    days_to_ship_id   {DaysToShip.all.sample.id}
    price             {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
