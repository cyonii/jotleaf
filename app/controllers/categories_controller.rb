class CategoriesController < ApplicationController
  before_action :require_login!
  before_action :set_category, only: %i[show edit update destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'New category added successfully'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path, notice: 'Category deleted successfully'
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
