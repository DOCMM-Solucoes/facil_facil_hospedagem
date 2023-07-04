FactoryBot.define do
  factory :trip do
    establishment_id { FactoryBot.create(:establishment).id }
    guide_id { FactoryBot.create(:guide).id }
    checkin_date { Faker::Date.between(from: Date.today, to: Date.today + 1.year) }
  end
end
