FactoryBot.define do
  factory :address do
    street { FFaker::Address.street_address }
    postal_code { FFaker::AddressBR.zip_code }
    city { FFaker::Address.city }
    state { FFaker::AddressBR.state }
  end
end
