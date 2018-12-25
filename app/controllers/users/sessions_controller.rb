# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  skip_before_action :require_login, except: %i[destroy]
  skip_before_action :require_profile

  def new
    @user = User.new
  end

  def create
    if (@user = login(params[:email], params[:password]))
      redirect_back_or_to(user_profile_path, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:login, notice: 'ログアウトしました。')
  end
end
