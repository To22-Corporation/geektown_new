# frozen_string_literal: true

class RegistrationsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = Users::RegistrationService.register(user_params)

    if @user.save
      redirect_to @user, notice: '新規登録完了しました。'
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation,
      :age,
      :faculty_id,
      :university_id
    )
  end
end