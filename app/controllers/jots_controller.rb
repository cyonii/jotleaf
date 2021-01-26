class JotsController < ApplicationController
  before_action :require_login!
  before_action :set_jot, only: %i[show edit update destroy]
  before_action :author?, only: %i[edit update destroy]
  before_action :set_categories, only: %i[new create edit]

  def new
    @jot = Jot.new
  end

  def create
    @jot = current_user.jots.build(jot_params)

    if @jot.save
      redirect_to jot_path(@jot), notice: 'Jot created successfully'
    else
      render action: :new
    end
  end

  def show; end

  def edit; end

  def update
    if @jot.update(jot_params)
      redirect_to @jot, notice: 'Jot successfully updated'
    else
      render action: :edit
    end
  end

  def destroy
    @jot.destroy
    redirect_to root_path, notice: 'Jot deleted successfully'
  end

  private

  def author?
    return if @jot.author == current_user

    redirect_back(fallback_location: root_path, alert: 'Unauthorized')
  end

  def set_jot
    @jot = Jot.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def jot_params
    params.require(:jot).permit(:title, :text, :image, category_ids: [])
  end
end
