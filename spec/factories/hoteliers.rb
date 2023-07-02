FactoryBot.define do
  factory :hotelier do
    sequence(:id) { |n| n }

    name {Faker::Name.name}
  end
end





