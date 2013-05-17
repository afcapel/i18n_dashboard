require 'test_helper'

class I18nDashboardTest < ActiveSupport::TestCase

  test "should allow developers to set configurations with a block" do
    initial_value = I18nDashboard.configuration.layout
    I18nDashboard.configure do |config|
      config.layout = "custom_layout_developer"
    end
    user_set_value = I18nDashboard.configuration.inline_main_app_named_routes
    assert_not_equal initial_value, user_set_value
  end

  def teardown
    I18nDashboard.configure do |config|
      config.inspect
    end
  end

end
