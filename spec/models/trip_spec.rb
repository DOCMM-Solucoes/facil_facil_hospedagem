require 'rails_helper'

RSpec.describe Trip, type: :model do
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
