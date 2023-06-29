require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:establishment) { FactoryBot.create(:establishment) }
  let(:guide) { FactoryBot.create(:guide) }

  before do
    sign_in user
  end

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
    let(:trip) { FactoryBot.create(:trip) }

    it 'returns a successful response' do
      get :show, params: { id: trip.id }
      expect(response).to be_successful
    end

    it 'assigns @trip with the correct trip' do
      get :show, params: { id: trip.id }
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns @trip as a new Trip instance' do
      get :new
      expect(assigns(:trip)).to be_a_new(Trip)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new trip' do
        expect {
          post :create, params: { trip: FactoryBot.attributes_for(:trip, establishment_id: establishment.id, guide_id: guide.id) }
        }.to change { Trip.count }.by(1)
      end

      it 'redirects to the created trip' do
        post :create, params: { trip: FactoryBot.attributes_for(:trip, establishment_id: establishment.id, guide_id: guide.id) }
        new_trip = Trip.last
        expect(new_trip).to be_present
        expect(response).to redirect_to(trip_path(new_trip.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new trip' do
        trip_params = { establishment_id: nil, guide_id: nil }
        expect {
          post :create, params: { trip: trip_params }
        }.not_to change(Trip, :count)
      end

      it 'renders the new template' do
        post :create, params: { trip: { establishment_id: nil, guide_id: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    let(:trip) { FactoryBot.create(:trip) }

    it 'returns a successful response' do
      get :edit, params: { id: trip.id }
      expect(response).to be_successful
    end

    it 'assigns @trip with the correct trip' do
      get :edit, params: { id: trip.id }
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe 'PATCH #update' do
    let(:trip) { FactoryBot.create(:trip) }

    context 'with valid parameters' do
      it 'updates the trip' do
        new_date = Faker::Date.between(from: Date.today, to: Date.today + 1.year)
        patch :update, params: { id: trip.id, trip: { checkin_date: new_date } }
        trip.reload
        expect(trip.checkin_date).to eq(new_date)
      end
    end
  end
end
