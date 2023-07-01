FactoryBot.define do
  factory :trip do
    association :establishment
    association :guide
    checkin_date { Faker::Date.between(from: Date.today, to: Date.today + 1.year) }
  end
end
