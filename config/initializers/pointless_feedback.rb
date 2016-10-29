PointlessFeedback.setup do |config|
  # ==> Feedback Configuration
  # Configure the topics for the user to choose from on the feedback form
  config.message_topics = ['Complaint', 'Suggestion', 'Praise']

  # ==> Email Configuration
  # Configure feedback email properties (disabled by default)
  # Variables needed for emailing feedback
  config.email_feedback            = true
  config.send_from_submitter       = true
  #config.from_email                = 'feedback@krados.com'
  config.to_emails                 = ['feedback@krados.com']
  # config.google_captcha_site_key   = nil
  # config.google_captcha_secret_key = nil
end
