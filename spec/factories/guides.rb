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

    after(:build) do |guide|
      guide.address ||= FactoryBot.build(:address, addressable: guide)
    end
  end
end
