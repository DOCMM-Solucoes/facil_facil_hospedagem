FactoryBot.define do
  factory :trip do
    association :establishment
    association :guide
    checkin_date { FFaker::Time.between(Date.today, Date.today + 1.year).to_date }
  end
end
