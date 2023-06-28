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
      it 'Create room using factory' do
        room_type = build(:room)
        expect(room_type.status).to eq('A')
        expect(room_type.is_double).to be_truthy
        expect(room_type.maximum_capacity).to eq(6)
      end

      it 'Creates a new room' do
        expect {
          Room.create(name: 'Room Name', description: 'Lorem ipsum', reference: 'Room Ref.')
        }.to change(Room, :count).by(1)
      end

      it 'Reads an existing room' do
        room_type = create(:room)
        expect(Room.find(room_type.id)).to eq(room_type)
      end      

      it 'Update: modifying name, max. capacity and is_double' do
        room_type = build(:room)
        room_type.update(status: 'M', is_double: false, maximum_capacity: 4)
        expect(room_type.status).to eq('M')
        expect(room_type.is_double).to be_falsey
        expect(room_type.maximum_capacity).to be(4)
      end

      it 'Updates an existing room' do
        room_type = create(:room)
        new_description = 'Updated Description'
        room_type.update(description: new_description)
  
        expect(room_type.reload.description).to eq(new_description)
      end      

      it 'Delete room' do
        room_type = build(:room)
        room_type.destroy
        expect{ room_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'Deletes an existing room' do
        room_type = create(:room)
  
        expect {
          room_type.destroy
        }.to change(Room, :count).by(-1)
      end      
    end
  end
end
