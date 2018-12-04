# frozen_string_literal: true

class Users::ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params)
    current_user.profile = profile

    redirect_to action: 'index', id: current_user.id, notice: '更新完了しました'
  end

  def edit
  end

  def update
  end

  def profile_params
    params.require(:user).permit(
      :name,
      :university_id,
      :faculty_id
    )
  end
end
