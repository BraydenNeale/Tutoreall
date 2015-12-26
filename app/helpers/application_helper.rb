module ApplicationHelper
  # 0 = tutor
  # 1 = student

  def resource_name(user)
    if user == 0
      :tutor
    else
      :student
    end
  end

  def resource(user)
    if user == 0
      @resource ||= Tutor.new
    else
      @resource ||= Student.new
    end
  end

  def devise_mapping(user)
    @devise_mapping ||= Devise.mappings[resource_name(0)]
  end

  # def resource_name
  #   :tutor
  # end

  # def resource
  #   @resource ||= Tutor.new
  # end

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[resource_name]
  # end

  # check whether we are on a page that needs to do devise things
  # Horrible hack - there is probably an easier way to do this..
  def devise_page
    if 
      current_page?(new_student_registration_path) or
      current_page?(new_student_session_path) or 
      current_page?(new_student_password_path) or

      current_page?(new_tutor_registration_path) or
      current_page?(new_tutor_session_path) or
      current_page?(new_tutor_password_path)

      return true
    end

    return false
  end
end
