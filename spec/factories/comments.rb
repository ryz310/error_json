FactoryGirl.define do
  factory :comment do
    name { Faker::Name.name }
    body { Faker::Lorem.paragraph }
  end
end
