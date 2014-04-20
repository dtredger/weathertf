class CurrentForecast
  @queue = :forecast_queue

  def self.perform(user_id)
    user = User.find(user_id)
    Forecast.get_current_forecast(user)
  end


end

class PrintStuff
  @queue = :print_queue

  def self.perform(thing)
    puts thing
    print "!!#{thing}!!"
    $stdout.flush
  end

end

