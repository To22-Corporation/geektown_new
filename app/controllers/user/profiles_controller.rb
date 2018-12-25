# frozen_string_literal: true

class User::ProfilesController < ApplicationController
  before_action :profile?, only: %i[new create]
  before_action :no_profile?, only: %i[edit update show]

  def new
    set_master
    @profile = current_user.build_profile
    @profile.profile_skills.build
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to({ action: 'show' }, notice: '更新完了しました')
    else
      render :new
    end
  end

  def show
    set_master
    @user = User.includes(profile: [:university, :faculty, profile_skills: :skill]).find(current_user.id)
  end

  def edit
    set_master
    @profile = current_user.profile
  end

  def update
    if current_user.profile.update(profile_params)
      redirect_to({ action: 'show' }, notice: '更新完了しました')
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :image,
      :name,
      :university_id,
      :faculty_id,
      profile_skills_attributes: %i[id skill_id level _destroy]
    )
  end

  def profile?
    redirect_to action: :edit if current_user.profile
  end

  def no_profile?
    redirect_to action: :new unless current_user.profile
  end

  def set_master
    @universities = University.all
    @faculties = Faculty.all
    @skills = Skill.all
  end
end
