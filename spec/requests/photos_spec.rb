require 'rails_helper'
RSpec.describe TripsController, type: :request do
  let(:user) { FactoryBot.create(:user)}
  let!(:photos){FactoryBot.create(:photo)}

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response for trips index' do
      get photos_path
      expect(response).to have_http_status(:success)
    end
  end

end