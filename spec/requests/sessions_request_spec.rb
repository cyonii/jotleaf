require 'rails_helper'

RSpec.describe 'Session Management', type: :request do
  let(:user) { User.new(name: 'John Doe', username: 'johndoe') }

  it 'displays login page' do
    get login_path
    expect(response).to render_template(:login)
    expect(response).to have_http_status(:ok)
  end

  it 'logs in a user' do
    user.save!
    post login_path, params: { username: 'johndoe' }
    follow_redirect!

    expect(response.body).to include('Signed in successfully')
  end

  it 'chocks user at login page for invalid auth attempt' do
    post login_path, params: { username: 'inexistentuser' }

    expect(response.body).to include('User with username not found')
    expect(response).to render_template(:login)
  end

  it 'displays logout button for authenticated user' do
    user.save!
    post login_path, params: { username: user.username }
    follow_redirect!

    expect(response.body).to include('LOGOUT')
  end

  it 'logs out authenticated user' do
    user.save!
    post login_path, params: { username: user.username }
    post logout_path
    follow_redirect!

    expect(response.body).to include('Signed out successfully')
    expect(request.path).to eq(login_path)
  end
end
