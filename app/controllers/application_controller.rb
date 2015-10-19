class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise firstname and lastname - added
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  devise_group :user, contains: [:student, :tutor]

  # helper_method :current_user
  # helper_method :user_signed_in
  helper_method :is_tutor
  helper_method :is_student

  # def current_user
  #   current_student || current_tutor
  # end

  # def user_signed_in
  #   tutor_signed_in? || student_signed_in?
  # end

  # Possibly go through ajax call - but for now will add a route for this
  # def sign_out
  #   sign_out_and_redirect(current_user)
  # end

  def is_tutor
    return current_user.is_a? Tutor
  end

  def is_student
    return current_user.is_a? Student
  end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :firstname
  	devise_parameter_sanitizer.for(:account_update) << :firstname

  	devise_parameter_sanitizer.for(:sign_up) << :lastname
  	devise_parameter_sanitizer.for(:account_update) << :lastname
  end
end
