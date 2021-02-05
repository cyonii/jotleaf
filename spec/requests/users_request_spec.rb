require 'rails_helper'

RSpec.describe 'User Management', type: :request do
  let(:user_params) { { name: 'John Doe', username: 'johndoe' } }

  it 'creates a new user and sign them in' do
    get new_user_path
    expect(response).to render_template(:new)

    post users_path, params: { user: user_params }
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(root_path)
    follow_redirect!

    expect(response).to render_template('layouts/index')
    expect(response.body).to include('Welcome to Jot Leaf, johndoe')
  end
end
