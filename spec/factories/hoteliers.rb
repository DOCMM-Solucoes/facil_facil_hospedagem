FactoryBot.define do
  factory :hotelier do
    sequence(:id) { |n| n }

    name {Faker::Name.name}
    cpf {Faker::Number.number( digits: 11)}
    phone_number {Faker::PhoneNumber}
    plan {Faker::Number.digit}
  end
end





