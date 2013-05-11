require 'test_helper'

module I18nDashboard
  class TranslationTest < ActiveSupport::TestCase

    def setup
      Engine.redis.flushdb
      I18n.reload!
      Engine.redis.sadd('keys', 'a')
      Engine.redis.sadd('keys', 'b')
      Engine.redis.sadd('system_keys', 'b')
      Engine.redis.sadd('system_keys', 'c')
    end

    def create_test_translation
      Translation.create('test.hello', 'Hola', 'es')
    end

    test "should return union of keys and system_keys sorted" do
      assert_equal Translation.all, ['a', 'b', 'c']
    end

    test "should return match keys" do
      Engine.redis.sadd('keys', 'test.horse.hear')
      Engine.redis.sadd('system_keys', 'test.horse.nose')

      assert_equal Translation.all('horse'), ['test.horse.hear', 'test.horse.nose']
      assert_equal Translation.all('nose'), ['test.horse.nose']
    end

    test "should return sorted array of keys" do
      assert_equal Translation.keys, ['a', 'b']
    end

    test "should return sorted array of system_keys" do
      assert_equal Translation.system_keys, ['b', 'c']
    end


    test "should be true if exists in system_keys" do
      assert !Translation.system_key?('a')
      assert Translation.system_key?('b')
      assert Translation.system_key?('c')
    end

    test "should add the key to the set keys" do
      create_test_translation
      assert Translation.keys.include?('test.hello')
    end

    test "should be exist on I18n translations" do
      create_test_translation
      assert_equal I18n.t('test.hello', locale: 'es'), 'Hola'
    end

    test "should be true if the translation exists" do
      create_test_translation

      assert Translation.exists?('test.hello', 'es')
      assert !Translation.exists?('test.hello', 'en')
    end

    test "should remove the key from keys" do
      create_test_translation
      Translation.destroy('test.hello')
      assert !Translation.keys.include?('test.hello')
    end

    test "should remove the translation" do
      create_test_translation
      Translation.destroy('test.hello')
      assert !Engine.redis.exists('es.test.hello')
    end
  end
end
