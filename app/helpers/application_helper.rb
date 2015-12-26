module ApplicationHelper
  def resource_name
    :tutor
  end

  def resource 
    @resource ||= Tutor.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:tutor]
  end
end
