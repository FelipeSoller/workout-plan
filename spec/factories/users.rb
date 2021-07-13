FactoryBot.define do
  factory :user do
    password { Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) }
    email { Faker::Internet.email }
    profile { 'teacher'}
    teacher
    
    trait :confirmed do
      confirmed_at { Time.current }
    end

    trait :student do
      email { Faker::Internet.email }
      profile { 'student'}
      student
      teacher { nil }
    end
  end
end