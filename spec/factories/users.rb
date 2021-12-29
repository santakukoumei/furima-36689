FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'あ'}
    second_name           {'あ'}
    first_name_kana       {'ア'}
    second_name_kana      {'ア'}
    birth_date            {'1963-04-26'}
  end
end