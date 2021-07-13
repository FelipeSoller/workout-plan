FactoryBot.define do
  factory :teacher do
    name { Faker::Name.name[0..19] }
  end
end

