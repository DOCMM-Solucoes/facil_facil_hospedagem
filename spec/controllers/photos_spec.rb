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

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        attributes_for(:photo, images_id: images.id)
      end
      it 'create a new photo' do
        expect{post :create, params:{photo: valid_attributes}
        }.to change(Photo, :count).by(1)
      end
    end
  end
end