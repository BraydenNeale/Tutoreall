class ApplicationMailer < ActionMailer::Base
  # default from: ENV['EMAIL_FROM']
  default from: 'chris@tutorial.academy'
  layout 'mailer'
  helper :email
end
