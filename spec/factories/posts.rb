FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words }
    body { Faker::Lorem.sentence }
  end
end
