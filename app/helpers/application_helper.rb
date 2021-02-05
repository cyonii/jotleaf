module ApplicationHelper
  def user_signed_in?
    session[:user_id] ? true : false
  end

  def current_user
    user_signed_in? ? User.find(session[:user_id]) : nil
  end

  def flash_class
    return 'success' if flash[:notice]
    return 'danger' if flash[:alert]
  end

  def flash_message
    render 'layouts/flash_message' if flash.present?
  end

  def categories
    @categories = Category.all
  end

  def active_class(category)
    return 'active' if request.path == category_path(category)
  end
end
