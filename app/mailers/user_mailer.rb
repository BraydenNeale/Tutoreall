class UserMailer < ApplicationMailer

  def new_lesson_email(student, tutor, subject, lesson)
    @student = student
    @tutor = tutor
    @subject = subject
    @date = date
    @url = 'http://www.tutorial.academy'

    subject = 'A student has requested a lesson from you'
    
    # Tutor has set up the lesson - so email the student (else - opposite)
    if current_user.is_a? Tutor
      subject = 'A tutor has set up a lesson with you'
      mail(to: @student.email, subject: subject)
    else
      mail(to: @tutor.email, subject: subject)
    end
  end

  def lesson_change_email(student, tutor, subject)
    @student = student
    @tutor = tutor
    @subject = subject
    @date = date
    @url = 'http://www.tutorial.academy'

    subject = 'The details of one of your scheduled lessons have changed'
    to = @tutor
    if current_user.is_a? Tutor
      to = @student
    end

    mail(to: to, subject: subject)
  end
end
