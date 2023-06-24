require 'rails_helper'

RSpec.describe Room, type: :model do

  describe 'Factory tests' do
    context 'When using factory standard' do
      it 'Is valid' do
        expect(build(:room)).to be_valid
      end
    end
  end

  describe 'Room crud tests' do
    context 'Create, update and delete tests' do
      it 'Create room' do
        room_type = build(:room)
        expect(room_type.status).to eq('A')
        expect(room_type.is_double).to be(true)
        expect(room_type.maximum_capacity).to eq(6)
      end

      it 'Update: modifying the name and maximum_capacity field' do
        room_type = build(:room)
        room_type.update(status: 'M')
        room_type.update(maximum_capacity: 4)
        expect(room_type.status).to eq('M')
        expect(room_type.maximum_capacity).to be(4)
      end

      it 'Delete room' do
        room_type = build(:room)
        room_type.destroy
        expect{ room_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
