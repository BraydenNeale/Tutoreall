class PaymentMailer < ApplicationMailer
  def csv_export(file_path)
    to = 'chris@tutorial.academy'
    subject = "Tutorial Academy payments csv #{Date.today}"
    attachments[file_path] = File.read(file_path)

    mail(to: to, subject: subject)
  end

  def lesson_cancelled(lesson)
    @lesson = lesson
    to = 'chris@tutorial.academy'
    subject = 'Lesson id #{lesson.id} cancelled'

    mail(to: to, subject: subject)
  end
end