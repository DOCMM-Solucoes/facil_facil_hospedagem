# == Schema Information
#
# Table name: guides
#
#  id         :bigint           not null, primary key
#  cnpj       :string
#  company    :string
#  cpf        :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :guide do
    sequence(:id) { |n| n }
    name { Faker::Name.name }
    phone { FFaker::PhoneNumber.phone_number }
    cpf { FFaker::IdentificationBR.cpf }
    company { FFaker::Company.name }
    cnpj { FFaker::IdentificationBR.cnpj }

    after(:build) do |guide|
      guide.address ||= FactoryBot.build(:address, addressable: guide)
    end
  end
end
