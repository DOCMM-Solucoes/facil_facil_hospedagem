# == Schema Information
#
# Table name: trips
#
#  id               :bigint           not null, primary key
#  accomplished     :boolean
#  checkin_date     :date
#  checkin_time     :time
#  checkout_date    :date
#  checkout_time    :time
#  confirmed        :boolean
#  extra_coffee     :boolean
#  free_driver      :boolean
#  free_guide       :boolean
#  notes            :text
#  num_drivers      :integer
#  num_guides       :integer
#  num_people       :integer
#  num_rooms        :integer
#  rate_person_day  :float
#  signal_date      :date
#  signal_value     :float
#  suspended        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint           not null
#  guide_id         :bigint           not null
#
# Indexes
#
#  index_trips_on_establishment_id  (establishment_id)
#  index_trips_on_guide_id          (guide_id)
#
# Foreign Keys
#
#  fk_rails_...  (establishment_id => establishments.id)
#  fk_rails_...  (guide_id => guides.id)
#
FactoryBot.define do
  factory :trip do
    establishment_id { FactoryBot.create(:establishment).id }
    guide_id { FactoryBot.create(:guide).id }
    checkin_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    checkin_time { Faker::Time.between(from: '08:00 AM', to: '12:00 PM') }
    checkout_date { Faker::Date.between(from: Date.tomorrow, to: 1.year.from_now) }
    checkout_time { Faker::Time.between(from: '01:00 PM', to: '05:00 PM') }
    extra_coffee { Faker::Boolean.boolean }
    num_people { Faker::Number.between(from: 1, to: 10) }
    num_drivers { Faker::Number.between(from: 0, to: 3) }
    free_driver { Faker::Boolean.boolean }
    num_guides { Faker::Number.between(from: 0, to: 3) }
    free_guide { Faker::Boolean.boolean }
    num_rooms { Faker::Number.between(from: 1, to: 5) }
    rate_person_day { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    signal_value { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    signal_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    notes { Faker::Lorem.paragraph }
    confirmed { Faker::Boolean.boolean }
    accomplished { Faker::Boolean.boolean }
    suspended { Faker::Boolean.boolean }
  end
end
