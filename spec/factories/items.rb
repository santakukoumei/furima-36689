FactoryBot.define do
  factory :item do
    user
    item_name          {Faker::Lorem.sentence}
    explanation        {Faker::Lorem.sentence}
    category_id        {2}
    details_id         {2}
    price              {Random.rand(300 .. 9999999)}
    burdened_id        {2}
    delivery_area_id   {2}
    delivery_day_id    {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item_image.jpg'), filename: 'item-image.jpg')
    end
  end
end
