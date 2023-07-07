require 'rails_helper'

RSpec.describe 'Guides', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:guide) { FactoryBot.create(:guide) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response for guides index' do
      get guides_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response for guide show' do
      get guide_path(guide)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response for new guide form' do
      get new_guide_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new Guide" do
        expect {
          post guides_path, params: { guide: FactoryBot.attributes_for(:guide) }
        }.to change(Guide, :count).by(1)
        expect(response).to redirect_to(Guide.last)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response for editing a guide' do
      get edit_guide_path(guide)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a guide' do
      expect {
        delete guide_path(guide)
      }.to change(Guide, :count).by(-1)
      expect(response).to redirect_to(guides_path(locale: I18n.default_locale))
    end
  end
end
