require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Onelink
  class Application < Rails::Application
    config.i18n.default_locale = :ja

		config.generators do |g|
		  g.test_framework :rspec,
		   fixtures: true,
		   view_specs: false,
		   helper_specs: false,
		   routing_specs: false,
		   controller_specs: true,
		   request_specs: false
		  g.fixture_replacement :factory_girl, dir: "spec/factories"
		end


		config.time_zone = 'Tokyo'
		config.active_record.default_timezone = :local


    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
	    g.stylesheets false
	    g.javascripts false
	    g.helper false
	    g.test_framework false
    end
  end
end
