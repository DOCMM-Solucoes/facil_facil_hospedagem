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
end
