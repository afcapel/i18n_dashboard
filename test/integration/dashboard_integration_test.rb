class DashboardIntegrationTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test 'show translations' do
    visit '/'
    assert page.has_content? 'Translations'
  end
end