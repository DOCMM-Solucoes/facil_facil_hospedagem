require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:photo) { FactoryBot.create(:photo) }

  before do
    sign_in user
  end

  let(:invalid_attributes){
    {title: nil, description: nil}
  }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'Returns a success response' do
      get :show, params: { id: photo.id}
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) {
      {title: 'New Photo', description: 'New Photo Description'}
    }
    context 'With valid parameters' do
      it 'updates the photo description' do
        expect{
          post :create, params: { photo: valid_attributes }
        }.to change { Photo.count }.by(1)
      end

      it 'Returns a success response' do
        post :create, params: { photo: valid_attributes }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'Destroys the photo' do
      photo = create(:photo)
      expect{delete :destroy, params: {id: photo.id}
      }.to change(Photo, :count).by(-1)
    end
  end
end


