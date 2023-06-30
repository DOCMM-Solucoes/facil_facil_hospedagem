require 'rails_helper'

RSpec.describe Photo, type: :model do
  context "CRUD Photo" do

    #before do
    #user = FactoryBot.create(:user)
    #sign_in user
    #end

    describe 'create' do

      # create
      it 'Create Photo' do
        expect {Photo.create(title: 'Teste foto')}.to change(Photo, :count).by(1)
      end
    end

    describe 'validations' do
      it { should validate_presence_of(:title) }
    end

     # Update
     it 'Update Photo' do
     end

    end
end
