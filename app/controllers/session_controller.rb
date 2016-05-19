class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]) || User.find_by(login: params[:email])
    if user && user.authenticate(params[:password])
      if user.confirmation_token.blank? || user.confirmation_token.nil?

        if params[:remember_me]
          cookies.permanent[:auth_token] = user.auth_token
        else
          cookies[:auth_token] = user.auth_token
        end

        flash[:success] = t('actioncontroller.flash.session.logged_in', name: user.name)
        redirect_to root_url
      else
        flash.now[:danger] = t('actioncontroller.flash.session.not_confirmed')
        render :new
      end
    else
      flash[:danger] = t('actioncontroller.flash.session.wrong_password')
      render :new
    end
  end

  def destroy
    cookies.delete :auth_token

    flash[:success] = t('actioncontroller.flash.session.logged_out')
    redirect_to root_url
  end
end
