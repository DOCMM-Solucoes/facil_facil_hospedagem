require 'rails_helper'

RSpec.describe 'Trips', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:trip) { FactoryBot.create(:trip) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response for trips index' do
      get trips_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response for trip show' do
      get trip_path(trip)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response for new trip form' do
      get new_trip_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new Trip" do
        expect {
          post trips_path, params: { trip: FactoryBot.attributes_for(:trip) }
        }.to change(Trip, :count).by(1)
        expect(response).to redirect_to(Trip.last)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response for editing a trip' do
      get edit_trip_path(trip)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a trip' do
      expect {
        delete trip_path(trip)
      }.to change(Trip, :count).by(-1)
      expect(response).to redirect_to(trips_path(locale: I18n.default_locale))
    end
  end
end
