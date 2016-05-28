class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:index, :edit, :update, :destroy]

  def confirmation_email
    user = User.find_by(confirmation_token: params[:id])
    if user
      user.email_activate
      flash[:success] = t('user.controller.confirmation_success')
      redirect_to login_url
    else
      flash[:danger] = t('user.controller.confirmation_fail')
      redirect_to root_url
    end
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.confirmation_email(@user).deliver_now
      flash[:success] = t('user.controller.success', email: @user.email)
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :login)
    end
end
