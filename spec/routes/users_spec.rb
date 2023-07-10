# spec/routes/user_routes_spec.rb

require 'rails_helper'

RSpec.describe 'User Routes', type: :routing do
  it 'routes to user registration' do
    expect(get: '/users/sign_up').to route_to('devise/registrations#new')
    expect(post: '/users').to route_to('devise/registrations#create')
  end

  it 'routes to user authentication' do
    expect(get: '/users/sign_in').to route_to('devise/sessions#new')
    expect(post: '/users/sign_in').to route_to('devise/sessions#create')
    expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy')
  end

end
