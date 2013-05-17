require 'test_helper'

module I18nDashboard

  class ConfigurationTest < ActiveSupport::TestCase

    def setup
      @blog_configuration = I18nDashboard::Configuration.new
    end

    test "should set :authentication_method to nil" do
      assert_nil @blog_configuration.authentication_method
    end

    test "should set :layout to nil" do
      assert_nil @blog_configuration.layout
    end

    test "should set :inline_main_app_named_routes to false" do
      assert !@blog_configuration.inline_main_app_named_routes
    end
  end
end