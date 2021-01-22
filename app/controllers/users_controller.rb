class UsersController < ApplicationController
  before_action :require_login!, only: [:show]
  before_action :require_logout!, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Jot Leaf, #{@user.username}"
      redirect_to user_path(@user)
    else
      render action: :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
