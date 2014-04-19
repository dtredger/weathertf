require 'resque/tasks'

# loads the entire env; consider something less
task 'resque:setup' => :environment

# readme: https://github.com/resque/resque/blob/1-x-stable/README.markdown



# run with:
# QUEUE=<some queue name or *> rake resque:work