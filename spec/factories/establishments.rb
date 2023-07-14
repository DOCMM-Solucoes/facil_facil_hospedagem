FactoryBot.define do
  factory :establishment do
    sequence(:id) { |n| n }
    association :hotelier

    name {Faker::Name.name}
    qty_bedrooms {Faker::Number.between(from: 5, to: 500)}
    phone {Faker::PhoneNumber.phone_number}
    site {Faker::Internet.ip_v4_address}
  end
end

