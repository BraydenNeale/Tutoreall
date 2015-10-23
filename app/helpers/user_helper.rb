module UserHelper
  def is_tutor
    return current_user.is_a? Tutor
  end

  def check_is_tutor(user)
    return user.is_a? Tutor
  end

  def is_student
    return current_user.is_a? Student
  end

   def check_is_student(user)
    return user.is_a? Student
  end

  def this_tutor(tutor)
    return tutor_signed_in? && (current_user.id == tutor.id)
  end

  def this_student(student)
    return student_signed_in? && (current_user.id == student.id)
  end
end