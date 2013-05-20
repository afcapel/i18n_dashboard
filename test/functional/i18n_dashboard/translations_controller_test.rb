require 'test_helper'

module I18nDashboard
  class TranslationsControllerTest < ActionController::TestCase

    test "should process index" do
      process :index, use_route: :i18n_dashboard
      assert_response :success
      assert_not_nil assigns(:translations)
    end

    test "should process create as HTML" do
      process :create, key: 'test.lol', value: 'lol', locale: 'es', use_route: :i18n_dashboard, format: :html
      assert_redirected_to i18n_dashboard_root_path
    end

    test "should process create as JS" do
      process :create, key: 'test.lol', value: 'lol', locale: 'es', use_route: :i18n_dashboard, format: :js
      assert_not_nil assigns(:digest)
      assert_response :success
    end

    test "should process destroy as HTML" do
      process :destroy, use_route: :i18n_dashboard, format: :html
      assert_redirected_to i18n_dashboard_root_path

    end

    test "should process destroy as JS" do
      process :destroy, use_route: :i18n_dashboard, format: :js
      assert_response :success
    end

  end
end
