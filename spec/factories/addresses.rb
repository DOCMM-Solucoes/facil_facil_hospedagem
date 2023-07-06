FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    postal_code { Faker::Address.postcode }
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end
