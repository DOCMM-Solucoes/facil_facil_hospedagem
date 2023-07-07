FactoryBot.define do
  factory :guide do
    sequence(:id) { |n| n }
    name { Faker::Name.name }

    after(:build) do |guide|
      guide.address ||= FactoryBot.build(:address, addressable: guide)
    end
  end
end
