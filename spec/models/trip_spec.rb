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
require 'rails_helper'

RSpec.describe Trip, type: :model do

  describe 'factories' do
    it 'has a valid factory' do
      trip = FactoryBot.build(:trip)
      expect(trip).to be_valid
    end
  end

  describe 'create' do
    it 'creates a new trip' do
      expect {
        FactoryBot.create(:trip)
      }.to change(Trip, :count).by(1)
    end
  end

  describe 'update' do
    it 'updates the trip' do
      trip = FactoryBot.create(:trip)
      new_date = trip.checkin_date

      trip.update(checkin_date: new_date)

      expect(trip.checkin_date).to eq(new_date)
    end
  end

  describe 'delete' do
    it 'deletes the trip' do
      trip = FactoryBot.create(:trip)

      expect {
        trip.destroy
      }.to change(Trip, :count).by(-1)
    end
  end

  describe 'read' do
    it 'reads the trip' do
      trip = FactoryBot.create(:trip)

      expect(Trip.find(trip.id)).to eq(trip)
    end
  end

  describe 'validations' do
    let(:trip) { FactoryBot.build(:trip) }

    it 'validates presence of establishment_id' do
      trip.establishment_id = nil
      expect(trip).not_to be_valid
    end

    it 'validates presence of guide_id' do
      trip.guide_id = nil
      expect(trip).not_to be_valid
    end

    it { should validate_presence_of(:checkin_date) }
    it { should validate_presence_of(:checkout_date) }
    it { should validate_presence_of(:num_people) }

    it do
      should validate_numericality_of(:num_people)
               .only_integer
               .is_greater_than(0)
    end
  end

  describe 'associations' do
    it { should belong_to(:establishment) }
    it { should belong_to(:guide) }
  end
end
