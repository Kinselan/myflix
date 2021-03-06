Myflix::Application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false

  config.assets.compress = true
  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
  config.action_mailer.default_url_options = { host: 'https://immense-dusk-34126.herokuapp.com/' }


  #
  # ActionMailer::Base.smtp_settings = {
  #   :port           => ENV['MAILGUN_SMTP_PORT'],
  #   :address        => ENV['MAILGUN_SMTP_SERVER'],
  #   :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  #   :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  #   :domain         => 'https://immense-dusk-34126.herokuapp.com',
  #   :authentication => :plain,
  # }
  # ActionMailer::Base.delivery_method = :smtp

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address:              ENV['SENDINBLUE_SMTP_SERVER'],
    port:                 ENV['SENDINBLUE_SMTP_PORT'],
    domain:               'immense-dusk-34126.herokuapp.com',
    user_name:            ENV['SENDINBLUE_SMTP_LOGIN'],
    password:             ENV['SENDINBLUE_SMTP_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true  }


  # enabling below will suppress email errors
  # config.action_mailer.raise_delivery_errors = false
end
