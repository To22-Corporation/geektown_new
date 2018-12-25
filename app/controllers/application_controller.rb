class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :require_profile
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to login_path, alert: 'ログインしてください'
  end

  def require_profile
    redirect_to new_user_profile_path, alert: 'purofi-rukinyuuしてください' unless current_user.profile
  end
end
