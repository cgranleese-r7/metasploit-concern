require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_record/railtie'

require 'metasploit/concern/engine'

Bundler.require(*Rails.groups)
require "metasploit/concern"

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    I18n.enforce_available_locales = true

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Raise deprecations as errors
    config.active_support.deprecation = :raise

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    config.paths.add 'app/concerns', autoload: true

    config.autolaoder = :zeitwerk
  end
end

