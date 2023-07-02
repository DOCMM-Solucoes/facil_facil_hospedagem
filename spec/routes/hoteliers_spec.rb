require 'rails_helper'

RSpec.describe HoteliersController, type: :routing do
  context 'routes' do
    it 'routes to #index' do
      expect(get: '/hoteliers').to route_to('hoteliers#index')
    end
  end

  it 'routes to #new' do
    expect(get: '/hoteliers/new').to route_to('hoteliers#new')
  end
end
