module SessionHelper
  def current_user
    if cookies[:auth_token].present? || session[:user_id].present?
      User.find_by(id: cookies.signed[:user_id]) || User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    unless current_user.present?
      redirect_to root_url
      flash[:warning] = t('session.controller.not_logged')
    end
  end

  def is_admin?
    unless logged_in? && current_user.is_admin
      redirect_to root_url
      flash[:warning] = t('session.controller.not_admin')
    end
  end
end
