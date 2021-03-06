require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "localized_controllers"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Permitted locales available for the application
    I18n.available_locales = [:en, :ja]

    # This dummy application does not use the database now.
    config.active_record.maintain_test_schema = false
  end
end

