# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string
#  city             :string
#  postal_code      :string
#  state            :string
#  street           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#
FactoryBot.define do
  factory :address do
    association :addressable, factory: :hotelier
    street { FFaker::Address.street_address }
    postal_code { FFaker::AddressBR.zip_code }
    city { FFaker::Address.city }
    state { FFaker::AddressBR.state }
  end
end
