require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :"pt-BR"
    config.i18n.available_locales = [:en, :"pt-BR"]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for mailgun
    ActionMailer::Base.smtp_settings = {
      :port           => 587,
      :address        => ENV['smtp_address'],
      :domain         => ENV['mail_domain'],
      :user_name      => ENV['mail_username'],
      :password       => ENV['mail_password'],
      :authentication => :plain
    }

    #Configuração para o link que é enviado no email
    config.action_mailer.default_url_options = { host: ENV['host_name'] }
  end
end
