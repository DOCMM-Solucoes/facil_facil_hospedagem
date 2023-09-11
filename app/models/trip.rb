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
class Trip < ApplicationRecord
  belongs_to :establishment
  belongs_to :guide
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validates :num_people, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
