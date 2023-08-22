require 'rails_helper'

RSpec.describe 'Rooms API', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:room) { create(:room) }
  let(:valid_headers) { { } }

  let(:valid_params) {
    { room: {
      name: 'Room 301',
      description: 'Bedroom Suite 301',
      reference: 'Located on the 3rd floor, block 2',
      maximum_capacity: 6 }
    }
  }

  before do
    sign_in user
  end



  describe "GET /index", skip: true do
    it 'Renders a successful response', skip: true do
      get '/locale/rooms', headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it "returns http success", skip: true do
      get '/locale/rooms', headers: valid_headers, as: :json
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /rooms/:id', skip: true do
    it 'Returns an existing room' do
      get "/locale/rooms/#{room.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'Renders a successful response', skip: true do
      get "/locale/rooms/#{room.id}", as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /rooms', skip: true do
    context 'With valid parameters' do
      it 'Creates a new room', skip: true do
        expect {
          post '/locale/rooms', params: valid_params
        }.to change(Room, :count).by(1)
      end

      it 'Renders a JSON response with the new room', skip: true do
        post '/locale/rooms',
             params: valid_params, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update_room", skip: true do
    context "With valid parameters" do

      it 'Valid room attributes', skip: true do
        patch "/locale/rooms/#{room.id}", params:
          {
            name: 'New Name Room 999',
            description: 'New Description Bedroom Suite 999',
            reference: 'New Reference Located on the 999rd floor, block 999',
            maximum_capacity: 2
          }, headers: valid_headers, as: :json

        expect(response.status).to eq(200)
        expect(room.reload.name).to eq('New Name Room 999')
        expect(room.reload.description).to eq('New Description Bedroom Suite 999')
        expect(room.reload.reference).to eq('New Reference Located on the 999rd floor, block 999')
        expect(room.reload.maximum_capacity).to eq(2)
      end
    end
  end

  describe "DELETE /destroy", skip: true do
    let!(:room) { create(:room) }

    it "Deletes the room", skip: true do
      expect {
        delete "/locale/rooms/#{room.id}"
      }.to change(Room, :count).by(-1)
    end
  end
end
