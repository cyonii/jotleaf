require 'rails_helper'
require 'faker'

RSpec.describe 'Jots', type: :request do
  fixtures :categories

  let(:user) { User.create(name: 'John Doe', username: 'johndoe') }
  let(:jot_params) do
    { jot: {
      title: Faker::Book.title,
      text: Faker::Lorem.sentence(word_count: 300),
      category_ids: [categories(:one).id, categories(:two).id],
      image: fixture_file_upload(Rails.root.join('spec/files/images/image-1.png'))
    } }
  end

  before(:each) do
    post login_path, params: { username: user.username }
  end

  it 'gets new jot article page' do
    get new_jot_path
    expect(response.body).to include('Jot it down')
  end

  it 'creates a new jot article' do
    post jots_path, params: jot_params
    follow_redirect!

    expect(response.body).to include('Jot created successfully')
  end

  it 'gets jot show page' do
    jot = Jot.create(jot_params[:jot].update({ author: user }))
    get jot_path(jot)
    expect(response.body).to include(jot_params[:jot][:title])
  end

  it 'gets edit jot article page' do
    jot = Jot.create(jot_params[:jot].update({ author: user }))
    get edit_jot_path(jot)
    expect(response.body).to include('Edit jot')
  end

  it 'updates jot article' do
    jot = Jot.create(jot_params[:jot].update({ author: user }))
    patch jot_path(jot), params: { jot: { title: 'Edited' } }
    follow_redirect!

    expect(response.body).to include('Jot successfully updated')
  end

  it 'deletes jot article' do
    jot = Jot.create(jot_params[:jot].update({ author: user }))
    delete jot_path(jot)
    follow_redirect!

    expect(response.body).to include('Jot deleted successfully')
  end
end
