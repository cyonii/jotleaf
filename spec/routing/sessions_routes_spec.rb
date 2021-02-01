require 'rails_helper'

RSpec.describe 'Session Routes' do
  it 'routes GET /login to #login' do
    expect(get: '/login').to route_to(controller: 'sessions', action: 'login')
  end

  it 'routes POST /login to #login' do
    expect(post: '/login').to route_to(controller: 'sessions', action: 'login')
  end

  it 'routes POST /logout to #logout' do
    expect(post: '/logout').to route_to(controller: 'sessions', action: 'logout')
  end
end
