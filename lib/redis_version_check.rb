# lib/redis_version_check.rb

require 'redis'

class RedisVersionCheck
  REQUIRED_VERSION = '5.0.0'

  def self.check
    redis = Redis.new
    version = redis.info('server')['redis_version']
    if Gem::Version.new(version) < Gem::Version.new(REQUIRED_VERSION)
      raise "Redis version #{REQUIRED_VERSION} or higher is required. Current version: #{version}"
    end
  end
end
