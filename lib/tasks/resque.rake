require 'resque/tasks'

# loads the entire env; consider something less
task 'resque:setup' => :environment