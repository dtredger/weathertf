#http://diveintohtml5.info/geolocation.html

get_location ->
    if (Modernizr.geolocation)
        navigator.geolocation.getCurrentPosition(loc_details, loc_error)
    else
    # no native support; maybe try a fallback?

loc_details (position) ->
    latitude = position.coords.latitude
    longitude = position.coords.longitude
    #let's show a map or do something interesting!

loc_error (positionError) ->
    if positionError == 1
        #user said no to sharing!
    else positionError ==2
        #actual error


#   google maps api to convert lat/longitude to city name ??
#   https://developers.google.com/maps/documentation/geocoding/#GeocodingResponses
# limit 2500

# http://developer.mapquest.com/web/products/dev-services/geocoding-ws
# limit 5000

    # $.ajax({ url:'http://maps.googleapis.com/maps/api/geocode/json?latlng='+position.coords.latitude+','+position.coords.longitude+'&sensor=true',
    #            success: function(data){
    #            alert(data.results[4].formatted_address);

    #            }
    #            });



# ----------------------------------------
# as an alternative (more compatible) there is also:     geoPosition.js


# if (geoPosition.init())         # init returns true if geoPosition is possible
#     geoPosition.getCurrentPosition(geoSuccess, geoError)
