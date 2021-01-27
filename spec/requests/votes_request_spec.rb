require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  fixtures :jots, :votes

  let(:user) { User.create(name: 'John Doe', username: 'johndoe') }
  let(:vote) { votes(:one) }
  let(:jot) { jots(:one) }

  describe 'POST /create' do
    it 'creates new vote' do
      post login_path, params: { username: user.username }
      post "/jots/#{jot.id}/votes"
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response.body).to include('Voted')
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes vote' do
      vote.update(user: user)
      post login_path, params: { username: user.username }

      delete "/jots/#{jot.id}/votes/#{vote.id}"
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response.body).to include('Unvoted')
    end
  end
end
