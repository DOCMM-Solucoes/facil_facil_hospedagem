require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    let(:trip) { FactoryBot.build(:trip) }

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


    it 'validates presence of establishment_id' do
      trip.establishment_id = nil
      expect(trip).not_to be_valid
    end

    it 'validates presence of guide_id' do
      trip.guide_id = nil
      expect(trip).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:establishment) }
    it { should belong_to(:guide) }
  end

  describe 'factories' do
    it 'has a valid factory' do
      trip = FactoryBot.build(:trip)
      expect(trip).to be_valid
    end
  end
end