# frozen_string_literal: true

class Users::ProfilesController < ApplicationController
  before_action :has_profile, only: %i[new create]

  def new
    @universities = University.all
    @faculties = Faculty.all
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to action: :edit, user_id: current_user.id, notice: '更新完了しました'
    else
      render :new
    end
  end

  def edit
    @universities = University.all
    @faculties = Faculty.all
    @profile = current_user.profile
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to action: :edit, user_id: current_user.id, notice: '更新完了しました'
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

  def has_profile
    if current_user.profile
      redirect_to action: :edit, user_id: current_user.id
    end
  end
end
