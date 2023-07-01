FactoryBot.define do
  factory :photo do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    association :images
  end
end