FactoryBot.define do
  factory :student do
    name { Faker::Name.name[0..19]}
    teacher 
  end
end

