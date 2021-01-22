module SessionsHelper
  def session_controls
    if user_signed_in?
      link_to 'LOGOUT', logout_path, method: :post, class: 'nav-link text-danger'
    else
      link_to 'LOGIN', login_path, class: 'nav-link'
    end
  end

  def user_controls
    if user_signed_in?
      link_to "@#{current_user.username}", user_path(current_user), class: 'nav-link'
    else
      link_to 'REGISTER', new_user_path, class: 'nav-link'
    end
  end
end
