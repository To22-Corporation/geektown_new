class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception

  private

  def not_authenticated
    binding.pry
    redirect_to login_path, alert: 'ログインしてください'
  end
end
