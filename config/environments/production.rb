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


  # test if below will suppress mail delivery errors
  config.action_mailer.raise_delivery_errors = false
end
