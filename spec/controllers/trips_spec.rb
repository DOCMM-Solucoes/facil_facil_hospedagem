require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @trips with all trips' do
      trip1 = FactoryBot.create(:trip)
      trip2 = FactoryBot.create(:trip)
      get :index
      expect(assigns(:trips)).to eq([trip1, trip2])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      trip = FactoryBot.create(:trip)
      get :show, params: { id: trip.id }
      expect(response).to be_successful
    end
  end

  it 'assigns @trip with the correct trip' do
    trip = FactoryBot.create(:trip)
    get :show, params: { id: trip.id }
    expect(assigns(:trip)).to eq(trip)
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to be_successful
    end

    it 'assigns @trip as a new Trip instance' do
      trip = FactoryBot.build(:trip)
      get :new
      expect(trip).to be_a_new(Trip)
    end
  end
end