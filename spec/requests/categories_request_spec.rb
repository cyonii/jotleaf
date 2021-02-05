require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  fixtures :users

  let(:category_params) { { category: { name: 'Test Category', priority: 3 } } }
  let(:category) { Category.create(category_params[:category]) }

  before(:each) do
    post login_path, params: { username: users(:one).username }
  end

  it 'gets new category page' do
    get new_category_path
    expect(response).to render_template(:new)
    expect(response.body).to include('Add new category')
  end

  it 'creates a new category' do
    post categories_path, params: category_params
    expect(response).to redirect_to(assigns(:category))

    follow_redirect!
    expect(response.body).to include('New category added successfully')
  end

  it 'gets category show page' do
    get category_path(category)

    expect(response.status).to be(200)
    expect(response).to render_template(:show)
  end

  it 'gets edit category page' do
    get edit_category_path(category)
    expect(response).to render_template(:edit)
    expect(response.body).to include("Edit #{category.name}")
  end

  it 'updates category' do
    patch category_path(category), params: { category: { name: 'Edited test category' } }
    follow_redirect!

    expect(response.body).to include('Category updated successfully')
  end

  it 'deletes category' do
    delete category_path(category)
    follow_redirect!

    expect(response.body).to include('Category deleted successfully')
  end
end
