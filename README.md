##WeatherPing
I never actually check the weather, so it'd be nice if something would alert me when it's about to precipitate.
- users enter their and phone details (number & carrier)
- html Geolocation API fills their lat/lon into signup form (or they can specify specific coordinates)
- uses SMS gateways to send SMS welcome message via appropriate [phone_num]@[carrier_suffix]
- Forecast.IO API is queried with current time and user's lat/lon
- app has pages that display weather for next hour, or daily summary
- *button to have hourly weather texted to you (temporary)

##Future issues:
- geolocation fallback for unsupported browsers? (IE < 9); possibly map-based
- background job to text user based on precipitation probability
- method to determine how often to query API (more often when rain more likely)

##Resources:
Geolocation API:
- http://diveintohtml5.info/geolocation.html
Forecast.IO
- https://developer.forecast.io/
- https://developer.forecast.io/docs/v2
- https://github.com/darkskyapp/forecast-ruby
