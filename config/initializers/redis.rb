uri = URI.parse(ENV["REDISCLOUD_URL"])
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

# username, password, hostname and port
# redis://rediscloud:rVj76dW6cYOeN1IT@pub-redis-14711.us-east-1-4.3.ec2.garantiadata.com:14711