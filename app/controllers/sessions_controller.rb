class SessionsController < ApplicationController
  before_action :require_logout!, only: [:login]
  before_action :require_login!, only: [:logout]

  def new; end

  def login
    case request.method
    when 'GET'
      render :login
    when 'POST'
      if !session_params[:username].empty? and (user = User.find_by(username: session_params[:username]))
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Signed in successfully'
      else
        flash.now[:alert] = 'User with username not found'
        render :login
      end
    end
  end

  def logout
    session.clear
    flash[:notice] = 'Signed out successfully'
    redirect_to login_path
  end

  private

  def session_params
    params.permit(:username)
  end
end
