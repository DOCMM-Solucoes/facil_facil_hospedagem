# == Schema Information
#
# Table name: establishments
#
#  id           :bigint           not null, primary key
#  name         :string
#  phone        :string
#  qty_bedrooms :string
#  site         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  hotelier_id  :bigint           not null
#
# Indexes
#
#  index_establishments_on_hotelier_id  (hotelier_id)
#
# Foreign Keys
#
#  fk_rails_...  (hotelier_id => hoteliers.id)
#
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

