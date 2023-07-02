require 'rails_helper'

RSpec.describe HoteliersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/hoteliers').to route_to('hoteliers#index')
    end
  end
end
