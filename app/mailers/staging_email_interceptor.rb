class StagingEmailInterceptor
  def self.delivering_email(message)
    message.to = ENV['STAGING_EMAIL_ADDRESS']
  end
end