# frozen_string_literal: true

class Users::ProfilesController < ApplicationController
  before_action :profile?, only: %i[new create]
  before_action :no_profile?, only: %i[edit update]

  def new
    set_master
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to({ action: 'edit', user_id: current_user.id }, notice: '更新完了しました')
    else
      render :new
    end
  end

  def edit
    set_master
    @profile = current_user.profile
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to({ action: 'edit', user_id: current_user.id }, notice: '更新完了しました')
    else
      render :new
    end
  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :university_id,
      :faculty_id
    )
  end

  private

  def profile?
    redirect_to action: :edit, user_id: current_user.id if current_user.profile
  end

  def no_profile?
    redirect_to action: :new unless current_user.profile
  end

  def set_master
    @universities = University.all
    @faculties = Faculty.all
  end
end
