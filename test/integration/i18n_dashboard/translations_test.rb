require 'test_helper'

class TranslationsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
    # Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test "create a new translation" do
    visit '/'

  end
end
