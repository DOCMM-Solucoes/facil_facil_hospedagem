require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let(:photos_attributes) {attributes_for(:photo, images: images)}
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end