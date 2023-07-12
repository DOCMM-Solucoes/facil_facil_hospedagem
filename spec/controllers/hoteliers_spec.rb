require 'rails_helper'

RSpec.describe HoteliersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:hotelier_attributes){attributes_for(:hotelier)}

  before do
    sign_in user
  end

  context 'Hotelier CRUD' do
    describe 'GET #index' do
      it 'render the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #new' do
      it 'render the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'creates a new hotelier' do
          expect{
            post :create, params:{ hotelier: hotelier_attributes}
          }.to change(Hotelier, :count).by(1)
        end
      end
    end

    describe 'GET #show' do
      it 'render the show template' do
        hotelier = create(:hotelier)
        get :show, params:{id: hotelier.id}
        expect(response).to render_template(:show)
      end
    end

    describe 'PATCH #update' do
      let(:hotelier){create(:hotelier)}
      let(:new_name){Faker::Name.name}

      context 'with valid attributes' do
        it 'updates the hotelier' do
          patch :update, params:{id:hotelier.id, hotelier:{name: new_name}}
          hotelier.reload
          expect(hotelier.name).to eq(new_name)
        end

        it 'redirects to the show page' do
          patch :update, params:{id:hotelier.id, hotelier:{name: new_name}}
          expect(response).to redirect_to(hotelier_path(hotelier))
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'delete the hotelier' do
        hotelier = create(:hotelier)
        expect{
          delete :destroy, params: {id: hotelier.id}
        }.to change(Hotelier, :count).by(-1)
      end
      it 'redirects to the index page' do
        hotelier = create(:hotelier)
        delete :destroy, params: {id: hotelier.id}
        expect(response).to redirect_to(hoteliers_path)
      end
    end
  end
end
