require 'rails_helper'

RSpec.describe 'User Routes' do
  it 'GET /users does not expose list of users' do
    expect(get: '/users').not_to be_routable
  end

  it 'routes GET /users/new to #new action' do
    expect(get: '/users/new').to route_to(controller: 'users', action: 'new')
  end

  it 'routes GET /users/1 to #show page' do
    expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
  end

  it 'routes POST /users to #create action' do
    expect(post: '/users').to route_to(controller: 'users', action: 'create')
  end
end
