class JotsController < ApplicationController
  before_action :require_login!
  before_action :set_categories, only: %i[new create]

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

  def show
    @jot = Jot.find(params[:id])
  end

  private

  def set_categories
    @categories = Category.all
  end

  def jot_params
    params.require(:jot).permit(:title, :text, :image, category_ids: [])
  end
end
