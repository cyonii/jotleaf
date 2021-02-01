require 'rails_helper'

RSpec.describe 'Category Routes' do
  it 'routes GET /categories/new to #new action' do
    expect(get: '/categories/new').to route_to(controller: 'categories', action: 'new')
  end

  it 'routes POST /categories to #create action' do
    expect(post: '/categories').to route_to(controller: 'categories', action: 'create')
  end

  it 'routes GET /categories/1 to #show action' do
    expect(get: '/categories/1').to route_to(controller: 'categories', action: 'show', id: '1')
  end

  it 'routes GET /categories/1/edit to #edit action' do
    expect(get: '/categories/1/edit').to route_to(controller: 'categories', action: 'edit', id: '1')
  end

  it 'routes PATCH /categories/1 to #update action' do
    expect(patch: '/categories/1').to route_to(controller: 'categories', action: 'update', id: '1')
  end

  it 'routes DELETE /categories/1 to #destroy action' do
    expect(delete: '/categories/1').to route_to(controller: 'categories', action: 'destroy', id: '1')
  end
end
