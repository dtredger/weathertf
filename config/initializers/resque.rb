# Redis config in initializers/redis.rb
# Resque Schedule in config/resque_schedule.yml


# require "resque"
require "resque_scheduler"
# require "resque/scheduler/server"

Resque.redis = REDIS

Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == ENV["RESQUE_PASS"] || "chowdah"
end


# start 5 workers with:
# COUNT=5 QUEUE=* rake resque:workers




# ---- Resque Scheduler ---- #
Resque::Scheduler.dynamic = true



# run with:
#  rake resque:scheduler




