PointlessFeedback.setup do |config|
  # ==> Feedback Configuration
  # Configure the topics for the user to choose from on the feedback form
  config.message_topics = ['Complaint', 'Suggestion', 'Praise']

  # ==> Email Configuration
  # Configure feedback email properties (disabled by default)
  # Variables needed for emailing feedback
  config.email_feedback            = true
  # config.send_from_submitter       = true
  config.from_email                = ENV['MAILER_EMAIL_ADDRESS']
  config.to_emails                 = [ENV['MAILER_EMAIL_ADDRESS']]
  # config.google_captcha_site_key   = nil
  # config.google_captcha_secret_key = nil
end
