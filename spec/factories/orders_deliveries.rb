FactoryBot.define do
  factory :orders_deliveries do

    postal_code { '123-4567' }
    delivery_area_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '01234567890' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
