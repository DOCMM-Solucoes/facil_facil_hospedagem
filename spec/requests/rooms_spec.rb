require 'rails_helper'

RSpec.describe 'Rooms API', type: :request do
  let!(:rooms) { create_list(:room, 5) }
  let(:room_id) { rooms.first.id }

  describe 'GET /locale/rooms' do
    before { get '/locale/rooms' }

    #it 'returns all rooms' do
    #  expect(json).not_to be_empty
    #  expect(json.size).to eq(5)
    #end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /locales/rooms/:id' do
    before { get "/locale/rooms/#{room_id}" }

    context 'When the room exists' do
      #it 'returns the room' do
      #  expect(json).not_to be_empty
      #  expect(json['id']).to eq(room_id)
      #end

      it 'Returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When the room does not exist' do
      let(:room_id) { 100 }

      it 'Returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

end

