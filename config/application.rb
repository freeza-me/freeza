require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Freeza
  class Application < Rails::Application

    config.i18n.enforce_available_locales = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    config.i18n.available_locales = [:en, :ja]

    ENV['REDIS_HOST'] ||= ENV['BOXEN_REDIS_HOST'] || 'localhost'
    ENV['REDIS_PORT'] ||= ENV['BOXEN_REDIS_PORT'] || '6379'
    ENV['REDIS_URL'] ||= "redis://#{ENV['REDIS_HOST'] || 'localhost'}:#{ENV['REDIS_PORT'] || 6379}"

    config.cache_store = :redis_store, "#{ENV['REDIS_URL']}/0/cache", { expires_in: 90.minutes }
  end
end
