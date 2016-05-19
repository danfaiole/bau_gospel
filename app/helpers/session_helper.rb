module SessionHelper
  def current_user
    if cookies[:auth_token].present? || session[:user_id].present?
      User.find_by(id: cookies.signed[:user_id]) || User.find_by(id: session[:user_id])
    end
  end
end
