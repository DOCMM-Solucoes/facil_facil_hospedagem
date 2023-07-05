require 'rails_helper'

RSpec.describe GuidesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:guide) { FactoryBot.create(:guide) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @guides with all guides' do
      guide1 = FactoryBot.create(:guide)
      guide2 = FactoryBot.create(:guide)
      get :index
      expect(assigns(:guides)).to eq([guide1, guide2])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: guide.id }
      expect(response).to be_successful
    end

    it 'assigns @guide with the correct guide' do
      get :show, params: { id: guide.id }
      expect(assigns(:guide)).to eq(guide)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns @guide as a new Guide instance' do
      get :new
      expect(assigns(:guide)).to be_a_new(Guide)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { guide: FactoryBot.attributes_for(:guide) } }

    context 'with valid parameters' do
      it 'creates a new guide' do
        expect {
          post :create, params: valid_params
        }.to change { Guide.count }.by(1)
      end

      it 'redirects to the created guide' do
        post :create, params: valid_params
        new_guide = Guide.last
        expect(new_guide).to be_present
        expect(response).to redirect_to(guide_path(new_guide.id))
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { id: guide.id }
      expect(response).to be_successful
    end

    it 'assigns @guide with the correct guide' do
      get :edit, params: { id: guide.id }
      expect(assigns(:guide)).to eq(guide)
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the guide' do
        new_name = guide.name
        patch :update, params: { id: guide.id, guide: { name: new_name } }
        guide.reload
        expect(guide.name).to eq(new_name)
      end
    end

    describe 'DELETE #destroy' do
      let!(:guide_to_destroy) { guide }

      it 'destroys the guide' do
        expect {
          delete :destroy, params: { id: guide_to_destroy.id }
        }.to change { Guide.count }.by(-1)
      end

      it 'redirects to the guides#index' do
        delete :destroy, params: { id: guide_to_destroy.id }
        expect(response).to redirect_to(guides_path)
      end
    end
  end
end
