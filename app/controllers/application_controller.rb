class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :require_login!, only: [:index]

  def index
    render 'layouts/index'
  end

  private

  def require_login!
    redirect_to login_path, alert: 'Log in to continue' unless user_signed_in?
  end

  def require_logout!
    redirect_back(fallback_location: root_path, notice: "You're already logged in") if user_signed_in?
  end
end
