require "redis"
require 'haml'
require 'twitter-bootstrap-rails'
require "i18n_dashboard/engine"
require "i18n_dashboard/configuration"

module I18nDashboard
  # Exception raised when gem may not be configured properly
  class ConfigurationError < StandardError;end

  # Set global configuration options for I18nDashboard
  # @see README.md
  def self.configure(&block)
    block.call(configuration)
  end

  # Returns I18nDashboard's globalconfiguration. Will initialize a new instance
  # if not already set
  def self.configuration
    @configuration ||= Configuration.new
  end

end
