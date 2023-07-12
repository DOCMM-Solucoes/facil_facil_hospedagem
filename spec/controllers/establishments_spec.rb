require 'rails_helper'

RSpec.describe EstablishmentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:hotelier) { FactoryBot.create(:hotelier)}
  let(:establishment_attributes){attributes_for(:establishment, hotelier: hotelier)}

  before do
    sign_in user
  end

  context 'Establishment CRUD' do

    describe 'GET #index' do
      it 'renders the index template' do
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
          attributes_for(:establishment, hotelier_id: hotelier.id)
        end

        it 'crete a new establishment' do
          expect{
            post :create, params:{establishment: valid_attributes}
          }.to change(Establishment, :count).by(1)
        end

        describe 'GET #show' do
          it 'renders the show template' do
            establishment = create(:establishment, hotelier_id: hotelier.id)
            get :show, params:{id: establishment.id}
            expect(response).to render_template(:show)
          end
        end

        describe 'PATCH update' do
          let(:establishment){create(:establishment, hotelier_id: hotelier.id)}
          let(:new_name) {Faker::Name.name}

          context 'with valid attributes' do
            it 'updates the establishment'do
              patch :update, params: {id: establishment.id, establishment:{name: new_name}}
              establishment.reload
              expect(establishment.name).to eq(new_name)
            end

            it 'redirects to show page' do
              patch :update, params: {id: establishment.id, establishment:{name: new_name}}
              expect(response).to redirect_to(establishment_path(establishment))
            end
          end
        end

        describe 'DELETE #destroy' do
          it 'delete the establishment' do
            establishment = create(:establishment, hotelier_id: hotelier.id)
            expect{
              delete :destroy, params: {id: establishment.id}
            }.to change(Establishment, :count).by(-1)
          end

          it 'redirects to the index page' do
            establishment = create(:establishment, hotelier_id: hotelier.id)
            delete :destroy, params: {id: establishment.id}
            expect(response).to redirect_to(establishments_path)
          end
        end
      end
    end
  end
end