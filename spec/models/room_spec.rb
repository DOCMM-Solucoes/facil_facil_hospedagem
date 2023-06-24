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
        room_type = Room.create(name: 'Room 101', description: 'Room 101', reference: 'Primeiro andar', maximum_capacity: 6, status: 'A')
        expect(room_type.name).to eq('Room 101')
        expect(room_type.reference).to eq('Primeiro andar')
      end

      it 'Update: modifying the name field' do
        room_type = Room.create(name: 'Room 101', description: 'Room 101', reference: 'Primeiro andar', maximum_capacity: 6, status: 'A')
        room_type.update(name: 'Room 1')
        expect(room_type.name).to eq('Room 1')
      end
    end
  end
end
