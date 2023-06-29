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

    it 'assigns @trip with the correct trip' do
      trip = FactoryBot.create(:trip)
      get :show, params: { id: trip.id }
      expect(assigns(:trip)).to eq(trip)
    end
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

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new trip' do
        user = FactoryBot.create(:user)
        sign_in user

        establishment = FactoryBot.create(:establishment)
        guide = FactoryBot.create(:guide)

        expect {
          post :create, params: { trip: FactoryBot.attributes_for(:trip, establishment_id: establishment.id, guide_id: guide.id) }
        }.to change { Trip.count }.by(1)
      end

      it 'redirects to the created trip' do
        user = FactoryBot.create(:user)
        sign_in user

        establishment = FactoryBot.create(:establishment)
        guide = FactoryBot.create(:guide)

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
        user = FactoryBot.create(:user)
        sign_in user

        trip_params = {
          establishment_id: nil,
          guide_id: nil
        }

        post :create, params: { trip: trip_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      user = FactoryBot.create(:user)
      sign_in user
      trip = FactoryBot.create(:trip)
      get :edit, params: { id: trip.id }
      expect(response).to be_successful
    end

    it 'assigns @trip with the correct trip' do
      user = FactoryBot.create(:user)
      sign_in user
      trip = FactoryBot.create(:trip)
      get :edit, params: { id: trip.id }
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe 'PATCH #update' do
    let(:trip) { FactoryBot.create(:trip) }

    context 'with valid parameters' do
      it 'updates the trip' do
        user = FactoryBot.create(:user)
        sign_in user

        new_date = Faker::Date.between(from: Date.today, to: Date.today + 1.year)
        patch :update, params: { id: trip.id, trip: { checkin_date: new_date } }
        trip.reload
        expect(trip.checkin_date).to eq(new_date)
      end
    end
  end
end

