require 'rails_helper'

RSpec.describe Room, type: :model do
  
  context "CRUD Room" do
    
    # create
    it 'Create Room' do
      room_type = Room.create(name: 'Room 101', description: 'Room 101', reference: 'Primeiro andar', maximum_capacity: 6, status: 'A')
      expect(room_type.name).to eq('Room 101')
      expect(room_type.reference).to eq('Primeiro andar')
    end

    # update I
    it 'Update Room 1' do
      room_type = Room.create(name: 'Room 101', description: 'Room 101', reference: 'Primeiro andar', maximum_capacity: 6, status: 'A')
      room_type.update(name: 'Room 1')
      expect(room_type.name).to eq('Room 1')
    end    

  end
end
