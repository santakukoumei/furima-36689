FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'test'}
    second_name           {'test'}
    first_name_kana       {'test'}
    second_name_kana      {'test'}
    birth_date            {'test'}
  end
end