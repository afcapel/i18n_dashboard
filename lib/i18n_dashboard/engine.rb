require "redis"

module I18nDashboard
  class Engine < ::Rails::Engine
    isolate_namespace I18nDashboard


    cattr_accessor :redis
    @@redis = Redis.new

    class << self
      def load!
        I18n.t('hello')
        translations = I18n.backend.send(:translations)
        keys = extract_i18n_keys(translations)


        Engine.redis.del('system_keys')
        to_resave = {}
        keys.each do |full_key|
          key = full_key.split('.')[1..-1].join('.')
          locale = full_key.split('.')[0]
          Engine.redis.sadd('system_keys', key)

          to_resave[full_key] = I18n.t(key, locale: locale)
        end

        I18n.backend = I18n::Backend::Chain.new(I18n::Backend::KeyValue.new(Engine.redis), I18n.backend)

        to_resave.each do |full_key, value|
          key = full_key.split('.')[1..-1].join('.')
          locale = full_key.split('.')[0]
          I18n.backend.store_translations(locale, {key => value}, :escape => false)
        end
      end

      def extract_i18n_keys(hash, parent_keys = [])
        hash.inject([]) do |keys, (key, value)|
          full_key = parent_keys + [key]
          if value.is_a?(Hash)
            # Nested hash
            keys += extract_i18n_keys(value, full_key)
          elsif value.present?
            # String leaf node
            keys << full_key.join(".")
          end
          keys
        end
      end
    end

  end
end
