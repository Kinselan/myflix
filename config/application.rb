require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Myflix
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true
    config.generators do |g|
      g.orm :active_record
      g.template_engine :haml
    end
    config.autoload_paths << "#{Rails.root}/lib"

    Raven.configure do |config|
      config.dsn = 'https://ae8a1bf4119747e6a95f9d6d17a03c0f:2dd1f0f71e0943ad9705e4017bae970e@sentry.io/274899'
    end
  end
end
