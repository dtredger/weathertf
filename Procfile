#web: bundle exec passenger start -p $PORT --max-pool-size 3
#resque: env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=10 bundle exec rake resque:work


web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque: env TERM_CHILD=1 COUNT=2 RESQUE_TERM_TIMEOUT=10 QUEUE=* bundle exec rake resque:workers