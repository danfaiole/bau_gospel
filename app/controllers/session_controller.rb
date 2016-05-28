class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]) || User.find_by(login: params[:email])
    if user && user.authenticate(params[:password])
      if user.confirmation_token.blank? || user.confirmation_token.nil?

        if params[:remember_me] == 1
          cookies.permanent[:auth_token] = user.auth_token
          cookies.signed[:user_id] = user.id
        else
          session[:user_id] = user.id
        end

        flash[:success] = t('session.controller.logged_in', name: user.name)
        redirect_to root_url
      else
        flash.now[:danger] = t('session.controller.not_confirmed')
        render :new
      end
    else
      flash[:danger] = t('session.controller.wrong_password')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:auth_token) if cookies[:auth_token].present?
    cookies.delete(:user_id) if cookies.signed[:user_id].present?

    flash[:success] = t('session.controller.logged_out')
    redirect_to root_url
  end
end
