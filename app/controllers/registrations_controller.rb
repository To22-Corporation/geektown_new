# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :check_logged_in
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = Users::RegistrationService.register(user_params)
    if @user.save && login(@user.email, user_params[:password])
      redirect_back_or_to(:users, notice: '新規登録完了しました')
    end
    render action: 'new'
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def check_logged_in
    # redirect_back fallback_location: root_path, alert: 'ログアウトしてください' if logged_in?
    redirect_to root_path, alert: 'ログアウトしてください' if logged_in?
  end
end
