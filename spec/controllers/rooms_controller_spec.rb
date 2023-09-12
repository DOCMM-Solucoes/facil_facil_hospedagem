require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  describe 'CRUD operations' do
    let(:user) { FactoryBot.create(:user) }
    
    before do
      sign_in user
    end    

    let(:valid_attributes) {
       { name: 'New Room', description: 'New Room Description', reference: 'New Room Reference' } 
    }

    let(:invalid_attributes) { 
      { name: nil, description: nil, reference: nil } 
    }
    
    let(:room) { create(:room) }

    describe 'GET #index' do
      it 'Returns a successful response' do
        get :index
        expect(response).to be_successful
      end
    end

    describe 'GET #show' do
      it 'Returns a success response' do
        get :show, params: { id: room.id }
        expect(response).to be_successful
      end
    end 

    describe 'POST #create', skip: true do
      context 'With valid parameters' do
        it 'Creates a new room' do
          expect {
            post :create, params: { room: valid_attributes }
          }.to change(Room, :count).by(1)
        end

        it 'Returns a success response' do
          post :create, params: { room: valid_attributes }
          expect(response).to have_http_status(:found)
        end        
      end
    end

    describe 'PUT #update' do
      context 'With valid parameters' do
        it 'Updates the requested room' do
          new_description = 'Updated description'
          put :update, params: { id: room.id, room: { description: new_description } }
          expect(room.reload.description).to eq(new_description)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'Destroys the room' do
        room = create(:room)
        
        expect {
          delete :destroy, params: { id: room.id }
        }.to change(Room, :count).by(-1)
      end
    end
  end
end
