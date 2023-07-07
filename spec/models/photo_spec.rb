require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'CRUD Photo' do
      it 'creates a new photo' do
        expect { Photo.create(title: 'Teste foto') }.to change { Photo.count }.by(1)
      end

    describe 'validations' do
      it { should validate_presence_of(:title) }
    end

    describe '#update' do
      let(:photo) { FactoryBot.create(:photo) }

      it 'updates the photo' do
        new_title = 'Updated title'
        photo.update(title: new_title)
        expect(photo.reload.title).to eq(new_title)
      end
    end
  end
end