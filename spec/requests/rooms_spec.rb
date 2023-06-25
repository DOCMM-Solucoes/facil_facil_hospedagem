require 'rails_helper'

RSpec.describe "/books", type: :request do
  
  let(:valid_attributes) {
    {
      name: 'Name Room',
      description: 'Description Room',
      reference: 'Reference Room'
    }
  }
  
  let(:invalid_attributes) {
    {
      name: '',
      description: '',
      reference: ''
    }
  }

 
  describe "GET /index" do
    it "Renders a successful response" do
      Room.create! valid_attributes
      get "/locale/rooms"
      expect(response).to be_successful
    end
  end  

  describe "GET /show" do
    it "Renders a successful response" do
      room = Room.create! valid_attributes
      get "/locale/rooms/#{room.id}"
      expect(response).to be_successful
    end
  end

  describe 'DELETE /rooms/:id' do
    it 'Deletes an existing room' do
      room = create(:room)

      expect {
        delete "/locale/rooms/#{room.id}"
      }.to change(Room, :count).by(0)
    end
  end  

end
