FactoryBot.define do
  factory :address do
    association :addressable, factory: :hotelier
    street { Faker::Address.street_address }
    postal_code { Faker::Address.zip_code }
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end