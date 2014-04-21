 # --- resque --- #
require 'resque/tasks'
require 'resque_scheduler/tasks'

# loads the entire env; consider something less
task 'resque:setup' => :environment do

# readme: https://github.com/resque/resque/blob/1-x-stable/README.markdown

end

# run with:
# QUEUE=<some queue name or *> rake resque:work





# --- resque_scheduler--- #
namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")
  end
end

# run with:
# rake resque:scheduler --trace