# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if (@user = login(params[:email], params[:password]))
      redirect_back_or_to(:users, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'ログアウトしました。')
  end
end
