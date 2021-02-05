require 'rails_helper'

RSpec.describe 'Jot Routes' do
  it 'routes GET /jots/new to #new action' do
    expect(get: '/jots/new').to route_to(controller: 'jots', action: 'new')
  end

  it 'routes POST /jots to #create action' do
    expect(post: '/jots').to route_to(controller: 'jots', action: 'create')
  end

  it 'routes GET /jots/1 to #show action' do
    expect(get: '/jots/1').to route_to(controller: 'jots', action: 'show', id: '1')
  end

  it 'routes GET /jots/1/edit to #edit action' do
    expect(get: '/jots/1/edit').to route_to(controller: 'jots', action: 'edit', id: '1')
  end

  it 'routes PATCH /jots/1 to #update action' do
    expect(patch: '/jots/1').to route_to(controller: 'jots', action: 'update', id: '1')
  end

  it 'routes DELETE /jots/1 to #destroy action' do
    expect(delete: '/jots/1').to route_to(controller: 'jots', action: 'destroy', id: '1')
  end
end
