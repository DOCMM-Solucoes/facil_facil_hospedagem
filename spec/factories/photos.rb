FactoryBot.define do
  factory :photo do
    title { Faker::Lorem.sentence }
  end
end