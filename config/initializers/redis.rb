
redis = ENV["REDISTOGO_URL"] ||= "redis://127.0.0.1:6379"
uri = URI.parse(redis)

REDIS = Redis.new(
	:host => uri.host, 
	:port => uri.port, 
	:password => uri.password, 
	:thread_safe => true
	)


# Resque config in initializers/resque.rb

# Resque.redis = REDIS