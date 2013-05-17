require 'test_helper'

module I18nDashboard
  class ApplicationHelperTest < ActionView::TestCase


    class MainAppApplicationHelperBench
      def dummy_thing_path
        "/dummy_thing"
      end
      def dummy_thing_url
        "http://host/dummy_thing"
      end
      def secret
      end
    end

    class I18nDashboardApplicationHelperBench
      include I18nDashboard::ApplicationHelper

      def main_app
        MainAppApplicationHelperBench.new
      end
    end


    def raw_helper
      I18nDashboardApplicationHelperBench.new
    end

    test "should not know named routes of the main app if not configured" do
      I18nDashboard.configure {|c| c.inline_main_app_named_routes = false }
      assert_raise(NoMethodError){
        raw_helper.dummy_thing_path
      }

      assert_raise(NoMethodError){
        raw_helper.dummy_thing_url
      }
    end

    test "should know named routes of the main app" do
      I18nDashboard.configure {|c| c.inline_main_app_named_routes = true }
      assert_equal "/dummy_thing", raw_helper.dummy_thing_path
      assert_equal "http://host/dummy_thing", raw_helper.dummy_thing_url
    end

    test "should not know anything but named routes of the main app" do
      I18nDashboard.configure {|c| c.inline_main_app_named_routes = true }
      assert_raise(NoMethodError) { raw_helper.secret }
    end

    test "should not know other routes" do
      I18nDashboard.configure {|c| c.inline_main_app_named_routes = true }
      assert_raise(NoMethodError) { raw_helper.junk_path }
      assert_raise(NoMethodError) { raw_helper.junk_url }
    end

  end
end
