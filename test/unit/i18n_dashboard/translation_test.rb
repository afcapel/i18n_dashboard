require 'test_helper'

module I18nDashboard
  class TranslationTest < ActiveSupport::TestCase

    def setup
      Engine.redis.flushdb
      Engine.redis.sadd('keys', 'a')
      Engine.redis.sadd('keys', 'b')
      Engine.redis.sadd('system_keys', 'b')
      Engine.redis.sadd('system_keys', 'c')
    end

    test "should return union of keys and system_keys" do
      assert_equal Translation.all, ['a', 'b', 'c']
    end
  end
end
