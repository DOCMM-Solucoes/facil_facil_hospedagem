FactoryBot.define do
  factory :establishment do
    sequence(:id) { |n| n }
    association :hotelier
  end
end