require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  let(:photos_attributes) {attributes_for(:photo, images: images)}
  let(:user) {FactoryBot.create(:user)}

  before  do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

  end
end