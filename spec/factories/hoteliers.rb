# == Schema Information
#
# Table name: hoteliers
#
#  id           :bigint           not null, primary key
#  cpf          :string
#  name         :string
#  phone_number :string
#  plan         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :hotelier do
    sequence(:id) { |n| n }

    name {Faker::Name.name}
    cpf {Faker::Number.number( digits: 11)}
    phone_number {Faker::PhoneNumber}
    plan {Faker::Number.digit}
  end
end





