FactoryBot.define do
  factory :trip do
    association :establishment
    association :guide
  end
end
