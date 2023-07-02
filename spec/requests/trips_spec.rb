require 'rails_helper'

RSpec.describe TripsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response for trips index' do
      get trips_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response for trip show' do
      trip = FactoryBot.create(:trip)
      get trip_path(trip)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response for new trip form' do
      user = FactoryBot.create(:user)
      sign_in user

      get new_trip_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new Trip" do
        user = FactoryBot.create(:user)
        sign_in user

        expect {
          post trips_path, params: { trip: FactoryBot.attributes_for(:trip) }
        }.to change(Trip, :count).by(1)
        expect(response).to redirect_to(Trip.last)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response for editing a trip' do
      user = FactoryBot.create(:user)
      sign_in user

      trip = FactoryBot.create(:trip)
      get edit_trip_path(trip)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a trip' do
      user = FactoryBot.create(:user)
      sign_in user

      trip = FactoryBot.create(:trip)
      expect {
        delete trip_path(trip)
      }.to change(Trip, :count).by(-1)
      expect(response).to redirect_to(trips_path(locale: I18n.default_locale))
    end
  end
end
