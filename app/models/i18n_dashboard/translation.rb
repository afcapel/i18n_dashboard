module I18nDashboard
  class Translation


    def self.all(string = nil)
      keys = Engine.redis.sunion('keys', 'system_keys')
      if string.present?
        keys = keys.grep(/#{string}/)
      end
      keys.sort
    end

    def self.keys
      Engine.redis.smembers('keys').sort!
    end

    def self.system_keys
      Engine.redis.smembers('system_keys').sort!
    end

    def self.system_key?(key)
      Engine.redis.sismember('system_keys', key)
    end

    def self.create(key, value, locale)
      if key.present?
        Engine.redis.sadd('keys', key)
        I18n.backend.store_translations(locale, {key => value}, :escape => false)
      end
    end

    def self.exists?(key, locale)
      Engine.redis.exists("#{locale}.#{key}")
    end

    def self.destroy(key)
      Engine.redis.srem('keys', key)
      I18n.available_locales.each do |locale|
        Engine.redis.del("#{locale}.#{key}")
      end
      I18n.reload!
    end
  end
end
