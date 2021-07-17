require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gemino
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.action_view.field_error_proc = Proc.new do |html_tag, instance| 
      if instance.class == ActionView::Helpers::Tags::Label
        "<div class=\"label_with_errors\">#{html_tag}</div>".html_safe
      else
        "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
