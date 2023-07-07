require 'rails_helper'
RSpec.describe TripsController, type: :request do
  let(:user) { FactoryBot.create(:user)}
  let!(:photo){FactoryBot.create(:photo)}

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response for trips index' do
      get photos_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    #let!(:photo) { FactoryBot.create(:photo) }
    it 'returns a successful response for trip show' do
      get photo_path(photo)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response for new trip form' do
      get new_photo_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new Photo" do
        expect {
          post photos_path, params: { photo: FactoryBot.attributes_for(:photo) }
        }.to change(Photo, :count).by(1)
        expect(response).to redirect_to(Photo.last)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a photo' do
      expect {
        delete photo_path(photo)
      }.to change(Photo, :count).by(-1)
      expect(response).to have_http_status(:redirect)
      expect(URI.parse(response.location).path).to eq(photos_path)
    end
  end
end