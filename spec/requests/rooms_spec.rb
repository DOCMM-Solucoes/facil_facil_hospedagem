require 'rails_helper'

RSpec.describe 'Rooms API', type: :request do
  describe 'POST /rooms' do
    let(:user) { FactoryBot.create(:user) }
    
    before do
      sign_in user
    end        

    context 'With valid parameters' do
      it 'Creates a new room' do
        expect {
          post '/locale/rooms', params: { 
            room: { name: 'Room 301',
                    description: 'Room / Apto. 301',
                    reference: 'Andar X - Bloco Y' } }
        }.to change(Room, :count).by(1)
        
        expect(response).to have_http_status(:created)
        expect(response_body).to include('Room 301')
        expect(response_body).to include('2')
      end
    end
  end
end
