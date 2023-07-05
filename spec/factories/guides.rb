FactoryBot.define do
  factory :guide do
    sequence(:id) { |n| n }
    name { Faker::Name.name }
  end
end