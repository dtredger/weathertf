# Redis config in initializers/redis.rb

Resque.redis = REDIS

Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == ENV["RESQUE_PASS"] || "chowdah"
end


# start 5 workers with:
# COUNT=5 QUEUE=* rake resque:workers