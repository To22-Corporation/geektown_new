# frozen_string_literal: true

class Users::ProfilesController < ApplicationController
  def show
    set_master
    @user = User.includes(profile: [:university, :faculty, profile_skills: :skill]).find(request.params["user_id"])
  end

  def set_master
    @universities = University.all
    @faculties = Faculty.all
    @skills = Skill.all
  end
end
