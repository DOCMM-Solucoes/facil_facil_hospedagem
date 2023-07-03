require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:photo_params) do
      {
        photo: {
          images: fixture_file_upload('spec/fixtures/avatar.png')
        }
      }
    end

    context 'with valid attributes' do
      it 'creates a new photo' do
        expect {
          post :create, params: photo_params
        }.to change(Photo, :count).by(1)
      end
    end
  end


  describe 'PUT #update' do
    context 'With valid parameters' do
      it 'Updates the requested room' do

      end
    end
  end

  describe 'DELETE #destroy' do
    it 'Destroys the room' do

    end
  end


end
