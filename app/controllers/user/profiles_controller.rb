# frozen_string_literal: true

class User::ProfilesController < ApplicationController
  skip_before_action :require_profile, only: %i[new create]
  before_action :profile?, only: %i[new create]

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
    @user = User.includes(profile: [profile_skills: :skill]).find(current_user.id)
  end

  def edit
    set_master
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to({ action: 'show' }, notice: '更新完了しました')
    else
      set_master
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :image,
      :name,
      #:grade,
      :comment,
      # :university_id,
      # :faculty_id,
      #:university,
      #:faculty,
      profile_skills_attributes: %i[id skill_id level _destroy]
    )
  end

  def profile?
    redirect_to action: :edit if current_user.profile
  end

  def set_master
    #@universities = University.all
    #@faculties = Faculty.all
    @skills = Skill.all
  end
end
