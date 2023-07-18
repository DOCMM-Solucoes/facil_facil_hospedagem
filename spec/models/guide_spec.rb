require 'rails_helper'

RSpec.describe Guide, type: :model do

  describe 'factories' do
    it 'has a valid factory' do
      trip = FactoryBot.build(:guide)
      expect(trip).to be_valid
    end
  end

  describe 'create' do
    it 'creates a new guide' do
      expect {
        FactoryBot.create(:guide)
      }.to change(Guide, :count).by(1)
    end
  end

  describe 'update' do
    it 'updates the guide' do
      guide = FactoryBot.create(:guide)
      new_name = 'New Guide'

      guide.update(name: new_name)

      expect(guide.name).to eq(new_name)
    end
  end

  describe 'delete' do
    it 'deletes the guide' do
      guide = FactoryBot.create(:guide)

      expect {
        guide.destroy
      }.to change(Guide, :count).by(-1)
    end
  end

  describe 'read' do
    it 'reads the guide' do
      guide = FactoryBot.create(:guide)

      expect(Guide.find(guide.id)).to eq(guide)
    end
  end

  describe 'associations' do
    it { should have_many(:trips) }
  end
end