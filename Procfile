#web: bundle exec passenger start -p $PORT --max-pool-size 3

web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb

# don't need this since the unicorn.rb file is modified to run workers on the web dyno
# resque: env TERM_CHILD=1 COUNT=2 RESQUE_TERM_TIMEOUT=10 QUEUE=* bundle exec rake resque:workers