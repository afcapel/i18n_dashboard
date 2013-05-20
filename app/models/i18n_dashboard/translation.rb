require 'digest/md5'

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
        digest = digest_key(key)
        Engine.redis.hset('keys_digest', digest, key)
        Engine.redis.sadd('keys', key)
        I18n.backend.store_translations(locale, {key => value}, :escape => false)
        digest
      end
    end

    def self.exists?(key, locale)
      Engine.redis.exists("#{locale}.#{key}")
    end

    def self.destroy(digest)
      key = Engine.redis.hget('keys_digest', digest)
      Engine.redis.srem('keys', key)
      Engine.redis.hdel("keys_digest", digest)
      I18n.available_locales.each do |locale|
        Engine.redis.del("#{locale}.#{key}")
      end
      I18n.reload!
    end

    def self.digest_key(key)
      Digest::MD5.hexdigest(key)
    end

    def self.rehash!
      self.all.each do |key|
        Engine.redis.hset('keys_digest', digest_key(key), key)
      end
      true
    end
  end
end
