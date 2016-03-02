class ApplicationMailer < ActionMailer::Base
  # -f -v mailcatcher args
  # default from: ENV['EMAIL_FROM']
  default from: 'chris@tutorial.academy'
  layout 'mailer'
  helper :email
end
