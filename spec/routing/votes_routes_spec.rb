require 'rails_helper'

RSpec.describe 'Vote Routes' do
  it 'routes POST /jots/1/votes to #create action' do
    expect(post: '/jots/1/votes').to route_to(controller: 'votes', action: 'create', jot_id: '1')
  end

  it 'routes DELETE /jots/1/votes/1 to #create action' do
    expect(delete: '/jots/1/votes/1').to route_to(controller: 'votes', action: 'destroy', jot_id: '1', id: '1')
  end
end
