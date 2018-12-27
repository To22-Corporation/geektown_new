module ApplicationHelper
  def link_to_add_fields(name, form, association, class_attributes)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields #{class_attributes}" + class_attributes, data: { id: id, fields: fields.gsub('\n', '') })
  end

  def check_skill_level(group, user)
    group_skills = group.group_skills
    profile_skills = user.profile ? user.profile.profile_skills : []
    return false if profile_skills.blank?

    group_skills.each do |group_skill|
      profile_skill = profile_skills.find_by(skill_id: group_skill.skill_id)
      return false unless profile_skill && profile_skill.level >= group_skill.level
    end
  end
end
