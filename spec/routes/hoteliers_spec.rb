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

  it 'routes to #show' do
    expect(get: '/hoteliers/1').to route_to('hoteliers#show', id: '1')
  end

  it 'routes to #edit' do
    expect(get: '/hoteliers/1/edit').to route_to('hoteliers#edit', id: '1')
  end

  it 'routes to #create' do
    expect(post: '/hoteliers').to route_to('hoteliers#create')
  end

  it 'routes to #update via PUT' do
    expect(put: 'hoteliers/1').to route_to('hoteliers#update', id: '1')
  end

  it 'routes to #update via PATCH' do
    expect(patch: 'hoteliers/1').to route_to('hoteliers#update', id: '1')
  end

  it 'routes to #destroy' do
    expect(delete: 'hoteliers/1').to route_to('hoteliers#destroy', id: '1')
  end
end
