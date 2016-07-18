require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'dotenv'

Bundler.require(*Rails.groups)

GMAIL_USERNAME = ENV['gmail_username']
GMAIL_PASSWORD = ENV['gmail_password']


module Shoppe
  class Application < Rails::Application
    config.generators.helper = false
    config.active_record.raise_in_transactional_callbacks = true
  end
end
